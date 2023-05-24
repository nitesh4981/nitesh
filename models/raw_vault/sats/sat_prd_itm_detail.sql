{%- set source_model = "v_stg_prd" -%}
{%- set src_pk = "PRD_PK" -%}
{%- set src_payload = ["ITM_DESC","MER_IND","FIRST_RCVD_DT","LAST_RCVD_DT","FIRST_SOLD_DT","LAST_SOLD_DT"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}