# Supabase Setup for Contributors

## Step 1: Create a Supabase Account and Project

1. Go to [https://supabase.com](https://supabase.com) and sign up for a free account
2. Click **New Project**
3. Choose a name (e.g. `cs464-dev`), a strong database password, and any region

---

## Step 2: Create the Database Schema

1. In your Supabase project dashboard, click **SQL Editor** in the left sidebar
2. Click **New query**
3. Copy the entire contents of [`supabase/schema.sql`](../supabase/schema.sql) and paste it into the editor
4. Click **Run**
5. It should say "Success, no rows returned".

---

## Step 3: Seed the Database

1. In the SQL Editor, open another **New query**
2. Copy the entire contents of [`supabase/seed.sql`](../supabase/seed.sql) and paste it into the editor
3. Click **Run**
4. It should say "Success, no rows returned".

---

## Step 4: Get Your Project Credentials

1. In the Supabase dashboard, you should see a **link** you can cop underneath the title, copy that.
1. In the Supabase dashboard, click the **gear icon** (Settings) in the left sidebar
1. Click **API** under the Configuration section
1. Copy two values:
   - **Project API keys → Publishble Key**

---

## Step 5: Configure Your Local Environment

1. In the root of the project, copy the `.env.local.exaxmple` and paste as `env.local`.
2. Open `.env.local` and fill in your values:

   ```
   NEXT_PUBLIC_SUPABASE_URL=https://your-project-ref.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
   ```

---

## Step 6: Run the App

```bash
npm run dev
```

The app will now fetch datasets from your personal Supabase project instead of local JSON files.
