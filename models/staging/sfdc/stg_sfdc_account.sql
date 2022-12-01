-- What are the opportunites to make this code better using following principles
-- DRY, Modular, Documentation, Styling, Naming

select
      a.id 
    , a.name as account_name,
    a.type as account_type,
    a.billing_city,
    a.billing_state,
    a.billing_postal_code,
    a.billing_country,
    a.website,
    a.dfox_industry_c as industry,
    a.dfox_sub_industry_c as sub_industry,
    GREATEST(ily_employees_exact_c,zi_employee_count_c,number_of_employees)
     as number_of_employees_final,
    case
        when number_of_employees_final >= 10000 then 'A) 10,000+'
        when number_of_employees_final >= 5000 then 'B) 5,000-9,999'
        when number_of_employees_final >= 2000 then 'C) 2,000-4,999'
        when number_of_employees_final >= 1000 then 'D) 1,000-1,999'
        when number_of_employees_final >= 500 then 'E) 500-999'
        when number_of_employees_final >= 251 then 'F) 251-499'
        when number_of_employees_final >= 100 then 'G) 100-250'
        when number_of_employees_final >= 0 then 'H) 0-99'
    end as company_size,
    
    a.lifecycle_c as lifecycle,
    
    a.ily_aws_spend_c as aws_spend,
    case when a.ily_aws_spend_c > 0 then TRUE else FALSE end as aws,
    a.ily_gcp_spend_c as gcp_spend,
    case when a.ily_gcp_spend_c > 0 then TRUE else FALSE end as gcp,
    a.ily_azure_spend_c as azure_spend,
    case when a.ily_azure_spend_c > 0 then TRUE else FALSE end as azure,
    
    a.rvp_top_target_account_c as rvp_top_target_account,
    a.rsm_top_target_account_c as rsm_top_target_account,
    a.sdr_top_target_account_c as sdr_top_target_account,
    a.ad_top_target_account_c as ad_top_target_account,
    
    case 
        when number_of_employees_final >= 10000 then '4. Large Enterprise'
        when number_of_employees_final >= 1000 then '3. Mid-Market'
        when number_of_employees_final >= 100 then '2. SMB'
        else '1. Startup'
    end as market_segment,
    
    case
        when dfox_account_score_c >= 1520 then '1. ICP/Tier 1'
        when dfox_account_score_c >=1480 then '2. ICP/Tier 2'
        when dfox_account_score_c >=1400 then '3. ICP/Tier 3'
        when dfox_account_score_c >=800 then '4. Serviceable'
        else '5. Non-Target'
    end as account_profile,

    {{ sales_region('a.billing_country', 'a.billing_state') }} as sales_region,
    {{ sales_sub_region('a.billing_country', 'a.billing_state', 'a.billing_postal_code') }} as sales_sub_region
    
from raw.sfdc_raw_data.account a
left join {{ ref('sfdc_user_info') }} u on a.owner_id = u.id
left join {{ ref('sfdc_user_info') }} uc on a.owner_id = uc.id
where not is_deleted