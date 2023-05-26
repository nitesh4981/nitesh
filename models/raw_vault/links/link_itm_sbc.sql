{%- set source_model = "v_stg_prd" -%}
{%- set src_pk = "LINK_PRD_ITM_SBC_PK" -%}
{%- set src_fk = ["ITM_ID", "SBC_ID"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}