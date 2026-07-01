/*
===========================================================
SafeHaven Migration 004
Purpose: Performance Indexes
===========================================================
*/

-----------------------------------------------------------
-- HOUSEHOLDS
-----------------------------------------------------------

create index if not exists idx_households_owner
on public.households(owner_user_id);

-----------------------------------------------------------
-- HOUSEHOLD MEMBERS
-----------------------------------------------------------

create index if not exists idx_members_user
on public.household_members(user_id);

create index if not exists idx_members_household
on public.household_members(household_id);

-----------------------------------------------------------
-- PROPERTIES
-----------------------------------------------------------

create index if not exists idx_properties_household
on public.properties(household_id);

-----------------------------------------------------------
-- ROOMS
-----------------------------------------------------------

create index if not exists idx_rooms_property
on public.rooms(property_id);

-----------------------------------------------------------
-- ITEMS
-----------------------------------------------------------

create index if not exists idx_items_household
on public.items(household_id);

create index if not exists idx_items_property
on public.items(property_id);

create index if not exists idx_items_room
on public.items(room_id);

create index if not exists idx_items_category
on public.items(category);

create index if not exists idx_items_brand
on public.items(brand);

create index if not exists idx_items_name
on public.items(item_name);

-----------------------------------------------------------
-- DOCUMENTS
-----------------------------------------------------------

create index if not exists idx_documents_household
on public.documents(household_id);

create index if not exists idx_documents_item
on public.documents(item_id);

create index if not exists idx_documents_type
on public.documents(document_type);

-----------------------------------------------------------
-- REMINDERS
-----------------------------------------------------------

create index if not exists idx_reminders_household
on public.reminders(household_id);

create index if not exists idx_reminders_item
on public.reminders(item_id);

create index if not exists idx_reminders_due
on public.reminders(due_date);

-----------------------------------------------------------
-- MAINTENANCE
-----------------------------------------------------------

create index if not exists idx_maintenance_item
on public.maintenance_history(item_id);

-----------------------------------------------------------
-- AI INSIGHTS
-----------------------------------------------------------

create index if not exists idx_ai_household
on public.ai_insights(household_id);

-----------------------------------------------------------
-- SEARCH HISTORY
-----------------------------------------------------------

create index if not exists idx_search_user
on public.search_history(user_id);

-----------------------------------------------------------
-- SETUP WIZARD
-----------------------------------------------------------

create index if not exists idx_setup_household
on public.setup_wizard_progress(household_id);
