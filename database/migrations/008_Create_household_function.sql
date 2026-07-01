/*
SafeHaven Migration 008
Purpose: Create household, owner membership, primary property, and default rooms in one transaction.
*/

create or replace function public.create_household_with_defaults(
  p_household_name text,
  p_property_name text default 'Main Home',
  p_city text default null,
  p_state text default null,
  p_year_built integer default null
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_household_id uuid;
  v_property_id uuid;
begin
  insert into public.households (
    owner_user_id,
    household_name,
    plan_type,
    completion_score
  )
  values (
    auth.uid(),
    p_household_name,
    'free',
    0
  )
  returning household_id into v_household_id;

  insert into public.household_members (
    household_id,
    user_id,
    role,
    invite_status
  )
  values (
    v_household_id,
    auth.uid(),
    'owner',
    'accepted'
  );

  insert into public.properties (
    household_id,
    property_name,
    property_type,
    city,
    state,
    year_built
  )
  values (
    v_household_id,
    p_property_name,
    'primary',
    p_city,
    p_state,
    p_year_built
  )
  returning property_id into v_property_id;

  insert into public.rooms (property_id, room_name, room_type)
  values
    (v_property_id, 'Kitchen', 'kitchen'),
    (v_property_id, 'Laundry Room', 'laundry'),
    (v_property_id, 'Garage', 'garage'),
    (v_property_id, 'Basement', 'basement'),
    (v_property_id, 'HVAC / Mechanical', 'mechanical'),
    (v_property_id, 'Living Room', 'living'),
    (v_property_id, 'Outdoor', 'outdoor');

  return v_household_id;
end;
$$;
