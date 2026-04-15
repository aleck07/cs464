import { supabase } from '@/lib/supabase'
import { DataFile, DataItem } from '@/types/data'

type ItemRow = { name: string; order_index: number }
type DatasetRow = { name: string; title: string; description: string; dataset_items: ItemRow[] }

function toDataFile(row: DatasetRow): DataFile {
    return {
        title: row.title,
        description: row.description,
        items: row.dataset_items
            .sort((a, b) => a.order_index - b.order_index)
            .map((item): DataItem => ({ name: item.name, order: item.order_index })),
    }
}

export async function GET(request: Request) {
    const { searchParams } = new URL(request.url)
    const name = searchParams.get('name')

    if (name) {
        const { data, error } = await supabase
            .from('datasets')
            .select('name, title, description, dataset_items(name, order_index)')
            .eq('name', name)
            .single()

        if (error || !data) {
            return Response.json({ error: `No dataset found for ${name}` }, { status: 404 })
        }

        return Response.json(toDataFile(data as DatasetRow))
    }

    const { data, error } = await supabase
        .from('datasets')
        .select('name, title, description, dataset_items(name, order_index)')

    if (error || !data) {
        return Response.json({ error: 'Failed to fetch datasets' }, { status: 500 })
    }

    const allData: Record<string, DataFile> = {}
    for (const row of data as DatasetRow[]) {
        allData[row.name] = toDataFile(row)
    }

    return Response.json({ datasets: allData })
}
