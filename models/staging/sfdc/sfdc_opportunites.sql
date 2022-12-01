
select
    o.id ,
    o.account_id as account_id,
    --
    act.account_name,
    act.account_type,
    act.market_segment,
    act.account_profile,
    act.company_size,
    act.aws,
    act.gcp,
    act.azure,
    act.industry,
    act.sub_industry,
    act.billing_country
    ,record_type_id as record_type_id,
    r.name as record_type_name,
    o.is_won as is_won,
    o.forecast_category_name as forecast_category_name,
    o.owner_id as opportunity_owner_id,
    u.name as opportunity_owner_name,
    u.email as opportunity_owner_email,
    o.created_date as created_date,
    o.created_by_id as created_by_id,
    uc.name as opportunity_created_by,
    o.last_modified_date as last_modified_date,
    o.last_modified_by_id,
    um.name as last_modified_by,
    
    umm.name as owner_manager_at_close,
    o.trial_start_date_c as trial_start_date,
    o.trial_end_date_c as trial_end_date,
    o.use_case_c as use_case,
    o.competitor_replacement_c as competitor_replacement,
    o.trial_completed_c as trial_completed,
    o.trial_stage_c as trial_stage,
    o.csm_c as csm_id,
    ucsm.name,
   
    op.term_list_price as list_amount,
    case when op.term_list_price > 0 then (op.term_list_price-o.amount)/op.term_list_price end as deal_discount,
    op.max_discount as max_discount,
    case when o.tcv_override_c >0 then tcv_override_c else o.amount end as tcv,
    coalesce(o.contract_signature_date_override_c, o.close_date) as contract_signature_date,
    op.min_term_start_date as contract_start_date,
    op.max_term_end_date as contract_end_date
    
from raw.sfdc_raw_data.opportunity o
left join {{ ref('sfdc_user_info') }} as u on o.owner_id = u.id
left join {{ ref('sfdc_user_info') }} as uc on o.created_by_id = uc.id
left join {{ ref('sfdc_user_info') }} as um on o.last_modified_by_id = um.id
left join {{ ref('sfdc_user_info') }} as umm on o.owner_manager_at_close_c = umm.id
left join {{ ref('sfdc_user_info') }} as ucsm on o.owner_manager_at_close_c = ucsm.id
left join {{ ref('sfdc_user_info') }} as useng on o.se_system_engineer_c =  useng.id
left join 
(  select
      opportunity_id,
       
      sum(term_list_price_c) as term_list_price,
      max(discount) as max_discount,
      min(term_start_date_c) as min_term_start_date,
      max(term_end_date_c) as max_term_end_date
  from raw.sfdc_raw_data.opportunity_line_item
  where not is_deleted
  group by 1
)
 as op on o.id = op.opportunity_id
left join (
    select
        id,
        name
    from raw.sfdc_raw_data.record_type
) as r on r.id = o.record_type_id
left join {{ ref('sfdc_accounts') }} as act ON o.account_id = act.account_id
where not o.is_deleted