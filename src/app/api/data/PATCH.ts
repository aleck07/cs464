import * as z from "zod";
import { getSupabaseClient } from "@/lib/supabase";
import { Dataset, DatasetDatabaseItem } from "@/types/data";
import { NextRequest } from "next/server";

const MIN_ITEMS = 2

const PatchData = z.object({
    title: z.string().min(1, "Title cannot be empty").optional(),
    description: z.string().optional(),
    items: z.array(
        z.object({
            name: z.string().min(1, "Item name cannot be empty"),
            order: z.number().min(0, "Item order must be a positive integer")
        })
    ).min(MIN_ITEMS, `At least ${MIN_ITEMS} item(s) are required`).optional()
})

export async function PATCH(request: NextRequest) {
    const { searchParams } = new URL(request.url)
    const name = searchParams.get('name')

    if (!name) {
        return Response.json({ error: 'Missing required query parameter: name' }, { status: 400 })
    }

    try {
        const body = PatchData.parse(await request.json())

        if (!body.title && body.description === undefined && !body.items) {
            return Response.json({ error: 'No fields provided to update' }, { status: 400 })
        }

        if (body.items) {
            const orderSet = new Set<number>(body.items.map(item => item.order))
            if (orderSet.size !== body.items.length) {
                return Response.json({ error: 'Item order values must be unique' }, { status: 400 })
            }
        }

        const supabase = getSupabaseClient()

        const { data: datasetData, error: datasetError } = await supabase
            .from('datasets')
            .select('id, dataset_slug, title, description')
            .eq('dataset_slug', name)
            .single()

        if (datasetError || !datasetData) {
            return Response.json({ error: `No dataset found for ${name}` }, { status: 404 })
        }

        const dataset = datasetData as Dataset

        if (body.title !== undefined || body.description !== undefined) {
            const updates: { updated_at: string; title?: string; description?: string } = { updated_at: new Date().toISOString() }
            if (body.title !== undefined) updates.title = body.title
            if (body.description !== undefined) updates.description = body.description

            const { error: updateError } = await supabase
                .from('datasets')
                .update(updates)
                .eq('id', dataset.id)

            if (updateError) {
                throw updateError
            }
        }

        if (body.items) {
            const { error: deleteError } = await supabase
                .from('dataset_items')
                .delete()
                .eq('dataset_id', dataset.id)

            if (deleteError) {
                throw deleteError
            }

            const itemsToInsert = body.items.map(item => ({
                dataset_id: dataset.id,
                item_name: item.name,
                item_order: item.order,
            }))

            const { error: insertError } = await supabase
                .from('dataset_items')
                .insert(itemsToInsert)

            if (insertError) {
                throw insertError
            }
        }

        const { data: updatedDataset, error: refetchError } = await supabase
            .from('datasets')
            .select('id, dataset_slug, title, description')
            .eq('dataset_slug', name)
            .single()

        if (refetchError || !updatedDataset) {
            throw refetchError
        }

        const { data: itemsData, error: itemsError } = await supabase
            .from('dataset_items')
            .select('item_name, item_order')
            .eq('dataset_id', dataset.id)
            .order('item_order', { ascending: true })

        if (itemsError) {
            throw itemsError
        }

        const items = (itemsData || []) as DatasetDatabaseItem[]
        const result: Dataset = {
            id: updatedDataset.id,
            title: updatedDataset.title,
            description: updatedDataset.description || '',
            items: items.map(item => ({
                name: item.item_name,
                order: item.item_order
            }))
        }

        return Response.json(result)

    } catch (err) {
        if (err instanceof z.ZodError) {
            return Response.json({ error: z.treeifyError(err) }, { status: 400 })
        } else if (err instanceof SyntaxError) {
            return Response.json({ error: 'Invalid JSON' }, { status: 400 })
        }
        console.error('Database error:', err)
        return Response.json({ error: 'Failed to update dataset' }, { status: 500 })
    }
}
