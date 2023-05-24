{%- set yaml_metadata -%}
source_model: 'raw_prd'
derived_columns:
  RECORD_SOURCE: '!RAW_PRDUCTS'
  LOAD_DATE: DATEADD(DAY, 1, FIRST_RCVD_DT)
  EFFECTIVE_FROM: 'FIRST_RCVD_DT'
hashed_columns:
  PRD_PK:
    - 'ITM_ID'
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