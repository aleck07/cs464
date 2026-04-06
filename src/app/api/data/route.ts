import { NextResponse } from 'next/server'
import fs from 'fs'
import path from 'path'

export async function GET() {
  const dataDir = path.join(process.cwd(), 'data')
  const files = fs.readdirSync(dataDir).filter(f => f.endsWith('.json'))

  const allData: Record<string, unknown> = {}
  for (const file of files) {
    const content = fs.readFileSync(path.join(dataDir, file), 'utf-8')
    allData[file.replace('.json', '')] = JSON.parse(content)
  }

  return NextResponse.json(allData)
}