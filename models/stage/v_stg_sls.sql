{%- set yaml_metadata -%}
source_model: 'raw_sls'
derived_columns:
  RECORD_SOURCE: '!RAW_SLS'
  LOAD_DATE: DATEADD(DAY, 1, DAY_ID)
  EFFECTIVE_FROM: 'DAY_ID'
hashed_columns:
  TXN_PK:
    - 'TXN_ID'
    - 'TXN_LN_ID'
  LOC_PK:
    - 'LOC_ID'
  PRD_PK:
    - 'ITM_ID'  
  LINK_TXN_ITM_PK:
    - 'TXN_ID'
    - 'TXN_LN_ID'
    - 'ITM_ID'  
  LINK_TXN_LOC_PK:
    - 'TXN_ID'
    - 'TXN_LN_ID'
    - 'LOC_ID'  
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