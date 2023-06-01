{%- set yaml_metadata -%}
source_model: 'raw_prd'
derived_columns:
  RECORD_SOURCE: '!RAW_PRDUCTS'
  LOAD_DATE: 'DAY_ID'
  EFFECTIVE_FROM: 'DAY_ID'
hashed_columns:
  PRD_PK:
    - 'ITM_ID'
  SBC_PK:
    - 'SBC_ID'
  CLS_PK:
    - 'CLS_ID'
  DIV_PK:
    - 'DIV_ID'
  LINK_PRD_ITM_SBC_PK:
    - 'ITM_ID'
    - 'SBC_ID'
  LINK_PRD_SBC_CLS_PK:
    - 'SBC_ID'
    - 'CLS_ID'
  PRD_ITM_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'ITM_ID'
      - 'ITM_DESC'
      - 'INV_IND'
      - 'SELLABLE_IND'
      - 'FIRST_RCVD_DT'
      - 'LAST_RCVD_DT'
      - 'FIRST_SOLD_DT'
      - 'LAST_SOLD_DT'                
      - 'LAST_SOLD_DT'                
      - 'LAST_SOLD_DT'
  PRD_SBC_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'SBC_ID'
      - 'SBC_DESC'    
  PRD_CLS_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'CLS_ID'
      - 'CLS_DESC'              
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