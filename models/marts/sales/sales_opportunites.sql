select
    opp.*,

    agg.total_price_paid_storage_agent_enterprise as total_price_paid_storage_agent_enterprise,
    agg.total_price_paid_storage_agent_standard as total_price_paid_storage_agent_standard,
    agg.total_price_paid_storage_account_standard as total_price_paid_storage_account_standard,
    agg.total_price_paid_storage_account_enterprise as total_price_paid_storage_account_enterprise,
    agg.total_price_paid_additional_storage as total_price_paid_additional_storage,        
    --Units
    agg.number_of_units_storage_agent_enterprise as number_of_units_storage_agent_enterprise,
    agg.number_of_units_storage_agent_standard as number_of_units_storage_agent_standard,
    agg.number_of_units_storage_account_standard as number_of_units_storage_account_standard,
    agg.number_of_units_storage_account_enterprise as number_of_units_storage_account_enterprise,
    agg.number_of_units_additional_storage as number_of_units_additional_storage,        
    --ACV Price Paid
    agg.acv_price_paid_storage_agent_enterprise as acv_price_paid_storage_agent_enterprise,
    agg.acv_price_paid_storage_agent_standard as acv_price_paid_storage_agent_standard,
    agg.acv_price_paid_storage_account_standard as acv_price_paid_storage_account_standard,
    agg.acv_price_paid_storage_account_enterprise as acv_price_paid_storage_account_enterprise,
    agg.acv_price_paid_additional_storage as acv_price_paid_additional_storage
    
from anlaytic.prod_sales.sfdc_opportunities opp
left join {{ ref('sfdc_opportunity_product_aggregate') }} agg 
    on opp.opportunity_id = agg.opportunity_id