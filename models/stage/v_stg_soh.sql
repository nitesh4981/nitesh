{%- set yaml_metadata -%}
source_model: 'raw_inv'
derived_columns:
  RECORD_SOURCE: '!RAW_INV'
  LOAD_DATE: 'DAY_ID'
  EFFECTIVE_FROM: 'DAY_ID'
hashed_columns:
  INV_PK:
    - 'LOC_ID'
    - 'ITM_ID'
  LOC_PK:
    - 'LOC_ID'
  ITM_PK:
    - 'ITM_ID'
  LINK_TXN_ITM_PK:
    - 'LOC_ID'
    - 'ITM_ID'
 INVENTORY_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'PARTKEY'
      - 'SUPPLIERKEY'
      - 'AVAILQTY'
      - 'SUPPLYCOST'
      - 'PART_SUPPLY_COMMENT'
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