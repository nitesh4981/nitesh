{%- set source_model = "v_stg_prd" -%}
{%- set src_pk = "CLS_PK" -%}
{%- set src_hashdiff = "PRD_CLS_HASHDIFF" -%}
{%- set src_payload = ["CLS_DESC"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

with sat as(
    {{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
)
select distinct * from sat                