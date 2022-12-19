select
    opportunity_id,
    //Total Price (TCV)
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then total_price_paid else 0 end) as total_price_paid_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then total_price_paid else 0 end) as total_price_paid_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then total_price_paid else 0 end) as total_price_paid_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then total_price_paid else 0 end) as total_price_paid_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then total_price_paid else 0 end) as total_price_paid_additional_storage,    
    //Units
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then number_of_units else 0 end) as number_of_units_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then number_of_units else 0 end) as number_of_units_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then number_of_units else 0 end) as number_of_units_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then number_of_units else 0 end) as number_of_units_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then number_of_units else 0 end) as number_of_units_additional_storage,    
    //ACV Price Paid
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then acv_price_paid else 0 end) as acv_price_paid_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then acv_price_paid else 0 end) as acv_price_paid_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then acv_price_paid else 0 end) as acv_price_paid_additional_storage
from (
select
     opportunity_id,
    opportunity_line_item_id,
    family,
    product_group,
    agent_type,
    term_start_date,
    term_end_date,
    round(months_between(term_end_date, term_start_date),0) as term_months,
    number_of_units,
    total_price as total_price_paid,
    list_price,
    case when term_months > 12 then total_price/round(months_between(term_end_date, term_start_date),0)*12 else total_price end as acv_price_paid
from {{ ref('sfdc_opportunity_line_item') }}
where is_closed
and is_won
)
group by 1
