{%- set source_model = "v_stg_loc" -%}
{%- set src_pk = "LOCATION_PK" -%}
{%- set src_payload = ['LOC_ID','CNCY_CDE','LOC_TYP_CDE','LOC_TYP_CDE_DESC','STR_TYP_CDE','STR_TYP_CDE_DESC','LOC_STATE_CDE','LOC_STATE_CDE_DESC','LOC_COUNTRY_CDE','LOC_COUNTRY_CDE_DESC','LOC_FMT_CDE','LOC_FMT_CDE_DESC','TSF_ZONE_CDE','TSF_ZONE_CDE_DESC','LOC_UPS_DST','LOC_VAT_RGN','LOC_STKHLD_IND','LOC_VAT_INCLUDE_IND','LOC_BREAK_PACK_IND','LOC_PHY_WH_NUM','LOC_VIRTUAL_WH_NUM','LOC_DEFAULT_WH_NUM','LOC_LAST_REMODEL_DT','LOC_START_DT','LOC_END_DT'] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_hashdiff = "LOCATION_HASHDIFF" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}