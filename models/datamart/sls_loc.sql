with cte as ( 
select
    LINK.LOC_ID,
    sum(f_sls_rtl_lcl)
from
DATAVAULT.DW_LND_RAW_VAULT_NITESH.SAT_SLS_TXN_LN_ITM src1 
inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_TXN hub on hub.txn_pk = src1.txn_pk
inner join DATAVAULT.DW_LND_RAW_VAULT_NITESH.LINK_TXN_LOC litm on litm.txn_id = hub.txn_id
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.HUB_LOC qualify row_number() over (partition by LOC_ID order by load_date)=1) itm on litm.LOC_ID = itm.LOC_ID
    inner join (select * from DATAVAULT.DW_LND_RAW_VAULT_NITESH.SAT_LOC qualify row_number() over(partition by LOC_ID order by load_date)=1) link on itm.LOC_ID = link.LOC_ID
group by
    1)
    select * from cte