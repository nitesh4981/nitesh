with tgt_open as 
(
    select 
    itm_key,
    store_key,
    f_oh_qty,
    f_unit_prc
     from DBT.DW_LND_TGT_NITESH_1.TGT_SOH where end_day_key = '9999-12-31'
),
stg as(
    select itm.itm_key, loc.store_key,day_id as day_key, end_day_id as end_day_key, soh.* from DBT.DW_LND_STG_NITESH_1.STG_SOH soh
    inner join {{ ref('tgt_store')}} loc on soh.store_id= loc.store_id
    inner join {{ ref('tgt_product')}} itm on soh.itm_id = itm.itm_id
)
select src.* from stg src left join tgt_open tgt on src.itm_key = tgt.itm_key and src.store_key = tgt.store_key
where (src.f_oh_qty <> tgt.f_oh_qty or src.f_unit_prc <> tgt.f_unit_prc)
or (tgt.f_oh_qty is null and tgt.f_unit_prc is null);