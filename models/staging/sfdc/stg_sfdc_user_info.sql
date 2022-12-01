with manager_info as (
  select
    id as manager_id,
    name as manager_name
  from raw.sfdc_raw_data.user
),

user_info as (
  select
    id,
    name,
    email,
    team_c as team,
    is_active,
    last_name,
    first_name,
    title,
    sub_region_c as sub_region,
    department,
    division,
    manager_id,
    created_date,
    start_date_c as start_date,
    rsm_end_date_c as rsm_end_date,
    last_login_date,
    ur.user_role_name,
    p.profile_name
  from raw.sfdc_raw_data.user u
  left join (select id as user_role_id, name as user_role_name from raw.sfdc_raw_data.user_role) ur
    on u.user_role_id = ur.user_role_id
  left join (select id as profile_id, name as profile_name from raw.sfdc_raw_data.profile) p
    on u.profile_id = p.profile_id
)

select
  u.*,
  m.manager_name
from user_info u
left join manager_info m
  on u.manager_id = m.manager_id