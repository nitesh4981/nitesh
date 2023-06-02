with cte as (
select
    loc_det.LOC_ID,
    cls_detail.cls_desc,
    sum(f_sls_rtl_lcl)
from
DATAVAULT.DW_LND_RAW_VAULT_NITESH.SAT_SLS_TXN_LN_ITM src1
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_TXN hub on hub.txn_pk = src1.txn_pk
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.LINK_TXN_LOC litl on litl.txn_id = hub.txn_id and litl.txn_ln_id = hub.txn_ln_id
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_LOC qualify row_number() over (partition by LOC_ID order by load_date)=1) loc on litl.LOC_ID = loc.LOC_ID
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.SAT_LOC qualify row_number() over(partition by LOC_ID order by load_date)=1) loc_det on loc.LOC_ID = loc_det.LOC_ID
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.LINK_TXN_ITM litm on litm.txn_id=hub.txn_id and litm.txn_ln_id=hub.txn_ln_id
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_ITM qualify row_number() over (partition by itm_id order by load_date) =1) itm on litm.itm_id=itm.itm_id
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.LINK_ITM_SBC link on itm.itm_id=link.itm_id
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_SBC sbc on sbc.sbc_id= link.sbc_id
    inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.LINK_SVC_CLS link_CLS on SBC.sbc_id=link_CLS.sbc_id
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_CLS qualify row_number() over (partition by cls_pk order by load_date) = 1) cls on cls.cls_id= link_cls.cls_id
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.sat_cls qualify row_number() over (partition by cls_pk order by load_date) = 1) cls_detail on cls.cls_pk = cls_detail.cls_pk
group by
    1,2)
    select * from cte