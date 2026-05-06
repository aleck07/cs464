import { getSupabaseClient } from "@/lib/supabase";
import { NextRequest } from "next/server";

export async function DELETE(request: NextRequest) {
    const { searchParams } = new URL(request.url)
    const name = searchParams.get('name')

    if (!name) {
        return Response.json({ error: 'Missing required query parameter: name' }, { status: 400 })
    }

    try {
        const supabase = getSupabaseClient()

        const { data, error } = await supabase
            .from('datasets')
            .delete()
            .eq('dataset_slug', name)
            .select('id')

        if (error) {
            throw error
        }

        if (!data || data.length === 0) {
            return Response.json({ error: `No dataset found for ${name}` }, { status: 404 })
        }

        return Response.json({ message: 'Dataset deleted' })

    } catch (error) {
        console.error('Database error:', error)
        return Response.json({ error: 'Failed to delete dataset' }, { status: 500 })
    }
}
