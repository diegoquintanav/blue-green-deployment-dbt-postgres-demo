{% macro swap_database() %}

    {% set sql_step_a='alter database db_blue rename to db_green_temp' %}
    {% do run_query(sql_step_a) %}
    {{ log("database db_blue swapped with db_green_temp", info=True) }}

    {% set sql_step_b='alter database db_green rename to db_blue' %}
    {% do run_query(sql_step_b) %}
    {{ log("database db_green swapped with db_blue", info=True) }}

    {% set sql_step_b='alter database db_green_temp rename to db_blue' %}
    {% do run_query(sql_step_b) %}
    {{ log("database db_green_temp swapped with db_blue", info=True) }}


{% endmacro %}

{% macro ref(model_name) %}

  {% do return(builtins.ref(model_name).include(database=false)) %}

{% endmacro %}
