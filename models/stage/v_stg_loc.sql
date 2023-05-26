{%- set yaml_metadata -%}
source_model: 'raw_loc'
derived_columns:
  RECORD_SOURCE: '!ORG_LOC_LU'
  LOAD_DATE: DATEADD(DAY, 1, current_date)
  EFFECTIVE_FROM: DATEADD(DAY,1,current_date)
hashed_columns:
  LOCATION_PK: 'LOC_ID'
  DISTRICT_PK: 'DST_ID'
  REGION_PK: 'RGN_ID'
  LOCATION_DISTRICT_PK:
    - 'LOC_ID'
    - 'DST_ID'
  LOCATION_REGION_PK:
    - 'LOC_ID'
    - 'RGN_ID'
  LOCATION_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'LOC_ID'
      - 'CNCY_CDE'
      - 'LOC_TYP_CDE'
      - 'LOC_TYP_CDE_DESC'
      - 'STR_TYP_CDE'
      - 'STR_TYP_CDE_DESC'
      - 'LOC_STATE_CDE'
      - 'LOC_STATE_CDE_DESC'
      - 'LOC_COUNTRY_CDE'
      - 'LOC_COUNTRY_CDE_DESC'
      - 'LOC_FMT_CDE'
      - 'LOC_FMT_CDE_DESC'
      - 'TSF_ZONE_CDE'
      - 'TSF_ZONE_CDE_DESC'
      - 'LOC_UPS_DST'
      - 'LOC_VAT_RGN'
      - 'LOC_STKHLD_IND'
      - 'LOC_VAT_INCLUDE_IND'
      - 'LOC_BREAK_PACK_IND'
      - 'LOC_PHY_WH_NUM'
      - 'LOC_VIRTUAL_WH_NUM'
      - 'LOC_DEFAULT_WH_NUM'
      - 'LOC_LAST_REMODEL_DT'
      - 'LOC_START_DT'
      - 'LOC_END_DT'
  DISTRICT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'DST_ID'
      - 'DST_DESC'
  REGION_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'RGN_ID'
      - 'RGN_DESC'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}



{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}

