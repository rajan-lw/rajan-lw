
select
    o.id ,
    o.account_id as account_id
    --
    , act.account_name
    , record_type_id as record_type_id,
    r.name as record_type_name,
    o.is_won as is_won,
    o.forecast_category_name 
    o.owner_id as opportunity_owner_id,
    u.email as opportunity_owner_email,
    uc.name as opportunity_created_by,
    uc.name as last_modified_by,
    op.term_list_price as list_amount,
    case when op.term_list_price > 0 then (op.term_list_price-o.amount)/op.term_list_price end as deal_discount,
    case when o.tcv_override_c >0 then tcv_override_c else o.amount end as tcv,
    coalesce(o.contract_signature_date_override_c, o.close_date) as contract_signature_date,
    
from raw.sfdc_raw_data.opportunity o
left join {{ ref('sfdc_user_info') }} as u on o.owner_id = u.id
left join {{ ref('sfdc_user_info') }} as uc on o.created_by_id = uc.id
left join 
(  select
      opportunity_id,
      sum(term_list_price_c) as term_list_price,
      max(discount) as max_discount
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