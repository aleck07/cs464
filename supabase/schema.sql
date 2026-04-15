-- CS464 Database Schema
-- Run this in the Supabase SQL editor before running seed.sql

CREATE TABLE IF NOT EXISTS datasets (
    id          SERIAL PRIMARY KEY,
    name        TEXT UNIQUE NOT NULL,  -- slug used as API query param (e.g. 'planets')
    title       TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS dataset_items (
    id          SERIAL PRIMARY KEY,
    dataset_id  INTEGER NOT NULL REFERENCES datasets(id) ON DELETE CASCADE,
    name        TEXT    NOT NULL,
    order_index INTEGER NOT NULL
);

-- allow public read, deny all writes from anon key
ALTER TABLE datasets      ENABLE ROW LEVEL SECURITY;
ALTER TABLE dataset_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read" ON datasets      FOR SELECT USING (true);
CREATE POLICY "public read" ON dataset_items FOR SELECT USING (true);
