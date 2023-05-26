{%- set source_model = ["v_stg_loc",] -%}
{%- set src_pk = "LOCATION_PK" -%}
{%- set src_nk = "LOC_ID" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}