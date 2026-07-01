/*
===========================================================
SafeHaven Migration 005
Purpose: Enable Row Level Security
===========================================================
*/

alter table public.profiles enable row level security;
alter table public.households enable row level security;
alter table public.household_members enable row level security;
alter table public.properties enable row level security;
alter table public.rooms enable row level security;
alter table public.items enable row level security;
alter table public.documents enable row level security;
alter table public.reminders enable row level security;
alter table public.maintenance_history enable row level security;
alter table public.ai_insights enable row level security;
alter table public.search_history enable row level security;
alter table public.setup_wizard_progress enable row level security;



create policy "Users can read own profile"
on public.profiles
for select
using (profile_id = auth.uid());

create policy "Users can update own profile"
on public.profiles
for update
using (profile_id = auth.uid());
