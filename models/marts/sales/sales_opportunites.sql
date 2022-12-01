select
    opp.*,

    agg.total_price_paid_storage_agent_enterprise as total_price_paid_storage_agent_enterprise,
    agg.total_price_paid_storage_agent_standard as total_price_paid_storage_agent_standard,
    agg.total_price_paid_storage_account_standard as total_price_paid_storage_account_standard,
    agg.total_price_paid_storage_account_enterprise as total_price_paid_storage_account_enterprise,
    agg.total_price_paid_additional_storage as total_price_paid_additional_storage,
        
    agg.total_price_paid_agent_enterprise as total_price_paid_agent_enterprise,
    agg.total_price_paid_agent_standard as total_price_paid_agent_standard,
        
    agg.total_price_paid_overage as total_price_paid_overage,
        
    agg.total_price_paid_agentless_standard as total_price_paid_agentless_standard,
    agg.total_price_paid_agentless_enterprise as total_price_paid_agentless_enterprise,
        
    agg.total_price_paid_premium_support as total_price_paid_premium_support,
    agg.total_price_paid_signature_support as total_price_paid_signature_support,
    agg.total_price_paid_standard_support as total_price_paid_standard_support,
    agg.total_price_paid_training as total_price_paid_training,

    agg.total_price_paid_ela_standard as total_price_paid_ela_standard,
    agg.total_price_paid_ela_enterprise as total_price_paid_ela_enterprise,
        
    agg.total_price_paid_credit_discount as total_price_paid_credit_discount,
        
    --Units
    agg.number_of_units_storage_agent_enterprise as number_of_units_storage_agent_enterprise,
    agg.number_of_units_storage_agent_standard as number_of_units_storage_agent_standard,
    agg.number_of_units_storage_account_standard as number_of_units_storage_account_standard,
    agg.number_of_units_storage_account_enterprise as number_of_units_storage_account_enterprise,
    agg.number_of_units_additional_storage as number_of_units_additional_storage,
        
    agg.number_of_units_agent_enterprise as number_of_units_agent_enterprise,
    agg.number_of_units_agent_standard as number_of_units_agent_standard,
        
    agg.number_of_units_overage as number_of_units_overage,
        
    agg.number_of_units_agentless_standard as number_of_units_agentless_standard,
    agg.number_of_units_agentless_enterprise as number_of_units_agentless_enterprise,
        
    agg.number_of_units_premium_support as number_of_units_premium_support,
    agg.number_of_units_signature_support as number_of_units_signature_support,
    agg.number_of_units_standard_support as number_of_units_standard_support,
    agg.number_of_units_training as number_of_units_training,

    agg.number_of_units_ela_standard as number_of_units_ela_standard,
    agg.number_of_units_ela_enterprise as number_of_units_ela_enterprise,
        
    agg.number_of_units_credit_discount as number_of_units_credit_discount,
        
    --ACV Price Paid
    agg.acv_price_paid_storage_agent_enterprise as acv_price_paid_storage_agent_enterprise,
    agg.acv_price_paid_storage_agent_standard as acv_price_paid_storage_agent_standard,
    agg.acv_price_paid_storage_account_standard as acv_price_paid_storage_account_standard,
    agg.acv_price_paid_storage_account_enterprise as acv_price_paid_storage_account_enterprise,
    agg.acv_price_paid_additional_storage as acv_price_paid_additional_storage,
        
    agg.acv_price_paid_agent_enterprise as acv_price_paid_agent_enterprise,
    agg.acv_price_paid_agent_standard as acv_price_paid_agent_standard,
        
    agg.acv_price_paid_overage as acv_price_paid_overage,
        
    agg.acv_price_paid_agentless_standard as acv_price_paid_agentless_standard,
    agg.acv_price_paid_agentless_enterprise as acv_price_paid_agentless_enterprise,
        
    agg.acv_price_paid_premium_support as acv_price_paid_premium_support,
    agg.acv_price_paid_signature_support as acv_price_paid_signature_support,
    agg.acv_price_paid_standard_support as acv_price_paid_standard_support,
    agg.acv_price_paid_training as acv_price_paid_training,

    agg.acv_price_paid_ela_standard as acv_price_paid_ela_standard,
    agg.acv_price_paid_ela_enterprise as acv_price_paid_ela_enterprise,
        
    agg.acv_price_paid_credit_discount as acv_price_paid_credit_discount

from anlaytic.prod_sales.sfdc_opportunities opp
left join {{ ref('sfdc_opportunity_product_aggregate') }} agg 
    on opp.opportunity_id = agg.opportunity_id