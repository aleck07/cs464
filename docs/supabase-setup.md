# Supabase Setup for Contributors

## Step 1: Create a Supabase Account and Project

1. Go to [https://supabase.com](https://supabase.com) and sign up.
2. Click **New Project**
3. Choose a name (e.g. `cs464-dev`) and database password.

## Step 2: Create the Database Schema

1. In your Supabase project dashboard, click **SQL Editor** in the left sidebar
2. Copy the entire contents of [`supabase/schema.sql`](../supabase/schema.sql) and paste it into the editor
3. Click **Run**
4. It should say "Success, no rows returned".

## Step 3: Seed the Database

1. In the SQL Editor, open a **New query**
2. Copy the entire contents of [`supabase/seed.sql`](../supabase/seed.sql) and paste it into the editor
3. Click **Run**
4. It should say "Success, no rows returned".

## Step 4: Get Your Project Credentials

1. In the Supabase dashboard, you should see a **link** you can cop underneath the title, click the copy button.
2. Within that dropdown you will see your **Project URL** and **Publishable Key** needed for `.env.local`.

## Step 5: Configure Your Local Environment

1. In the root of the project, copy the `.env.local.exaxmple` and paste as `env.local`.
2. Open `.env.local` and fill in your values:

   ```
   NEXT_PUBLIC_SUPABASE_URL=https://your-project-ref.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
   ```

## Step 6: Run the App

```bash
npm run dev
```

The app will now fetch datasets from your personal Supabase project instead of local JSON files.
