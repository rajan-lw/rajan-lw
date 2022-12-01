with product_2 as (
    select
        id,
        name,
        product_code,
        description,
        family,
        product_group_c as product_group
    from raw.sfdc_raw_data.product_2
    where is_active
    and not is_deleted
)

select * from product_2