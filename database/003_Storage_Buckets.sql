/*
===========================================================
SafeHaven Storage Bucket Configuration
Document ID: SH-DB-SQL-003
Version: 1.0
Author: Cory Gleisinger
===========================================================
Purpose:
Creates all Supabase Storage buckets required for
SafeHaven Release 1.0.
===========================================================
*/

-----------------------------------------------------------
-- RECEIPTS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('receipts','receipts',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- MANUALS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('manuals','manuals',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- WARRANTIES
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('warranties','warranties',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- INVENTORY PHOTOS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('photos','photos',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- PROFILE PHOTOS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('profile-photos','profile-photos',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- HOUSEHOLD DOCUMENTS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('documents','documents',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('exports','exports',false)
on conflict (id) do nothing;

-----------------------------------------------------------
-- FUTURE AI GENERATED REPORTS
-----------------------------------------------------------

insert into storage.buckets
(id, name, public)
values
('reports','reports',false)
on conflict (id) do nothing;
