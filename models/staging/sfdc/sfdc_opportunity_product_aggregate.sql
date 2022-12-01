select
    opportunity_id,
    //Total Price (TCV)
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then total_price_paid else 0 end) as total_price_paid_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then total_price_paid else 0 end) as total_price_paid_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then total_price_paid else 0 end) as total_price_paid_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then total_price_paid else 0 end) as total_price_paid_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then total_price_paid else 0 end) as total_price_paid_additional_storage,
    
    sum(case when family = 'Agent' and product_group = 'Agent (Enterprise)' then total_price_paid else 0 end) as total_price_paid_agent_enterprise,
    sum(case when family = 'Agent' and product_group = 'Agent (Standard)' then total_price_paid else 0 end) as total_price_paid_agent_standard,
    
    sum(case when family = 'Overage' and product_group = 'Overage' then total_price_paid else 0 end) as total_price_paid_overage,
    
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Standard)' then total_price_paid else 0 end) as total_price_paid_agentless_standard,
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Enterprise)' then total_price_paid else 0 end) as total_price_paid_agentless_enterprise,
    
    sum(case when family = 'Service' and product_group = 'Premium Support Plan' then total_price_paid else 0 end) as total_price_paid_premium_support,
    sum(case when family = 'Service' and product_group = 'Signature Support Plan' then total_price_paid else 0 end) as total_price_paid_signature_support,
    sum(case when family = 'Service' and product_group = 'Standard Support Plan' then total_price_paid else 0 end) as total_price_paid_standard_support,
    sum(case when family = 'Service' and product_group = 'Training' then total_price_paid else 0 end) as total_price_paid_training,

    sum(case when family = 'IaaS Account' and product_group = 'ELA (Standard)' then total_price_paid else 0 end) as total_price_paid_ela_standard,
    sum(case when family = 'ELA' and product_group = 'ELA (Enterprise)' then total_price_paid else 0 end) as total_price_paid_ela_enterprise,
    
    sum(case when family = 'Credit/Discount' and product_group = 'Other' then total_price_paid else 0 end) as total_price_paid_credit_discount,
    
    //Units
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then number_of_units else 0 end) as number_of_units_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then number_of_units else 0 end) as number_of_units_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then number_of_units else 0 end) as number_of_units_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then number_of_units else 0 end) as number_of_units_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then number_of_units else 0 end) as number_of_units_additional_storage,
    
    sum(case when family = 'Agent' and product_group = 'Agent (Enterprise)' then number_of_units else 0 end) as number_of_units_agent_enterprise,
    sum(case when family = 'Agent' and product_group = 'Agent (Standard)' then number_of_units else 0 end) as number_of_units_agent_standard,
    
    sum(case when family = 'Overage' and product_group = 'Overage' then number_of_units else 0 end) as number_of_units_overage,
    
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Standard)' then number_of_units else 0 end) as number_of_units_agentless_standard,
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Enterprise)' then number_of_units else 0 end) as number_of_units_agentless_enterprise,
    
    sum(case when family = 'Service' and product_group = 'Premium Support Plan' then number_of_units else 0 end) as number_of_units_premium_support,
    sum(case when family = 'Service' and product_group = 'Signature Support Plan' then number_of_units else 0 end) as number_of_units_signature_support,
    sum(case when family = 'Service' and product_group = 'Standard Support Plan' then number_of_units else 0 end) as number_of_units_standard_support,
    sum(case when family = 'Service' and product_group = 'Training' then number_of_units else 0 end) as number_of_units_training,

    sum(case when family = 'IaaS Account' and product_group = 'ELA (Standard)' then number_of_units else 0 end) as number_of_units_ela_standard,
    sum(case when family = 'ELA' and product_group = 'ELA (Enterprise)' then number_of_units else 0 end) as number_of_units_ela_enterprise,
    
    sum(case when family = 'Credit/Discount' and product_group = 'Other' then number_of_units else 0 end) as number_of_units_credit_discount,  
    
    //ACV Price Paid
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_storage_agent_enterprise,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Agent (Standard)' then acv_price_paid else 0 end) as acv_price_paid_storage_agent_standard,    
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Standard)' then acv_price_paid else 0 end) as acv_price_paid_storage_account_standard,
    sum(case when family = 'Storage' and product_group = '180 Days Storage - Account (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_storage_account_enterprise,
    sum(case when family = 'Storage' and product_group = 'Additional Storage' then acv_price_paid else 0 end) as acv_price_paid_additional_storage,
    
    sum(case when family = 'Agent' and product_group = 'Agent (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_agent_enterprise,
    sum(case when family = 'Agent' and product_group = 'Agent (Standard)' then acv_price_paid else 0 end) as acv_price_paid_agent_standard,
    
    sum(case when family = 'Overage' and product_group = 'Overage' then acv_price_paid else 0 end) as acv_price_paid_overage,
    
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Standard)' then acv_price_paid else 0 end) as acv_price_paid_agentless_standard,
    sum(case when family = 'IaaS Account' and product_group = 'Agentless (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_agentless_enterprise,
    
    sum(case when family = 'Service' and product_group = 'Premium Support Plan' then acv_price_paid else 0 end) as acv_price_paid_premium_support,
    sum(case when family = 'Service' and product_group = 'Signature Support Plan' then acv_price_paid else 0 end) as acv_price_paid_signature_support,
    sum(case when family = 'Service' and product_group = 'Standard Support Plan' then acv_price_paid else 0 end) as acv_price_paid_standard_support,
    sum(case when family = 'Service' and product_group = 'Training' then acv_price_paid else 0 end) as acv_price_paid_training,

    sum(case when family = 'IaaS Account' and product_group = 'ELA (Standard)' then acv_price_paid else 0 end) as acv_price_paid_ela_standard,
    sum(case when family = 'ELA' and product_group = 'ELA (Enterprise)' then acv_price_paid else 0 end) as acv_price_paid_ela_enterprise,
    
    sum(case when family = 'Credit/Discount' and product_group = 'Other' then acv_price_paid else 0 end) as acv_price_paid_credit_discount
    
from (
select
    opportunity_line_item_id,
    family,
    product_group,
    agent_type,
    opportunity_id,
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
