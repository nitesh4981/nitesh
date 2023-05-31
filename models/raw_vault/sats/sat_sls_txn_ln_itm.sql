{%- set source_model = "v_stg_sls" -%}
{%- set src_pk = "TXN_PK" -%}
{%- set src_hashdiff = "SLS_HASHDIFF" -%}
{%- set src_payload = ["DAY_ID","F_SLS_QTY","F_SLS_CST_LCL","F_SLS_RTL_LCL"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}