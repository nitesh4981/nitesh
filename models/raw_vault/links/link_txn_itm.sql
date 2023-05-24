{%- set source_model = "v_stg_sls" -%}
{%- set src_pk = "LINK_TXN_ITM_PK" -%}
{%- set src_fk = ["TXN_ID", "TXN_LN_ID","ITM_ID"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}