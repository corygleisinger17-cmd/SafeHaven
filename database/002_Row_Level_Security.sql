-- SafeHaven Row Level Security Script
-- Document ID: SH-DB-SQL-002
-- Version: 1.0

alter table users enable row level security;
alter table households enable row level security;
alter table household_members enable row level security;
alter table properties enable row level security;
alter table rooms enable row level security;
alter table items enable row level security;
alter table documents enable row level security;
alter table reminders enable row level security;
alter table maintenance_history enable row level security;
alter table ai_insights enable row level security;
alter table search_history enable row level security;
alter table setup_wizard_progress enable row level security;

-- Users can view their own user profile
create policy "Users can view own profile"
on users for select
using (auth.uid() = user_id);

create policy "Users can update own profile"
on users for update
using (auth.uid() = user_id);

-- Users can view households they belong to
create policy "Members can view households"
on households for select
using (
  household_id in (
    select household_id
    from household_members
    where user_id = auth.uid()
  )
);

-- Users can view household membership records for households they belong to
create policy "Members can view household members"
on household_members for select
using (
  household_id in (
    select household_id
    from household_members
    where user_id = auth.uid()
  )
);

-- Generic household access policies

create policy "Members can view properties"
on properties for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view items"
on items for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view documents"
on documents for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view reminders"
on reminders for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view maintenance history"
on maintenance_history for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view AI insights"
on ai_insights for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view search history"
on search_history for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);

create policy "Members can view setup wizard progress"
on setup_wizard_progress for select
using (
  household_id in (
    select household_id from household_members where user_id = auth.uid()
  )
);
