{{
     config(

     materialized='incremental',

     unique_key=['store_key','itm_key'],

     merge_update_columns = ['RCD_UPD_TS','end_day_key'],
    post_hook="""

 --insert temp data
    
    insert into {{ this }}
    (
          select
        itm_key,
        store_key,
        day_key,
        end_day_key,
        f_unit_prc,
        f_oh_qty,
        current_timestamp as RCD_INS_TS,
        current_timestamp as RCD_UPD_TS
    from {{ ref('tmp_soh') }}
    where (select count(distinct end_day_key) from {{ this }})>1
    )
    ;
   
    
    """
     )
}}
{% if is_incremental() %}
SELECT
    itm_key,
    store_key,
    day_key,
    current_date  as end_day_key,
    f_unit_prc,
    f_oh_qty,

    current_timestamp as RCD_INS_TS,

    tgt.RCD_UPD_TS

FROM {{ref("tmp_soh")}} tmp
inner join (select itm_key,store_key, max(RCD_UPD_TS) RCD_UPD_TS from DBT.DW_LND_tgt_RIKESH_1.tgt_SOH group by itm_key,store_key) tgt
on tgt.store_key=tmp.store_key
and tgt.itm_key=tmp.itm_key

{% else %}
  select
    itm_key,
    store_key,
    day_key,
    end_day_key,
    f_unit_prc,
    f_oh_qty,
    current_timestamp as RCD_INS_TS,
    current_timestamp as RCD_UPD_TS
  from {{ ref('tmp_soh') }}
{% endif %}