{% macro swap_schema() %}

    {% set sql_step_a='alter schema dbt_prod_blue rename to _dbt_prod_green_temp' %}
    {% do run_query(sql_step_a) %}
    {{ log("schema dbt_prod_blue swapped with _dbt_prod_green_temp", info=True) }}

    {% set sql_step_b='alter schema dbt_prod_green rename to dbt_prod_blue' %}
    {% do run_query(sql_step_b) %}
    {{ log("schema dbt_prod_green swapped with dbt_prod_blue", info=True) }}

    {% set sql_step_b='alter schema _dbt_prod_green_temp rename to dbt_prod_green' %}
    {% do run_query(sql_step_b) %}
    {{ log("schema _dbt_prod_green_temp swapped with dbt_prod_green", info=True) }}


{% endmacro %}
