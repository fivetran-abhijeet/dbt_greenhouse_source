{% macro get_scheduled_interview_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "application_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},

    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "interview_id", "datatype": dbt_utils.type_int()},
    {"name": "location", "datatype": dbt_utils.type_string()},
    {"name": "organizer_id", "datatype": dbt_utils.type_int()},
    
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{% if target.type == 'snowflake' %}
{{ columns.append( {"name": "end", "datatype": dbt_utils.type_timestamp() } ) }}
{{ columns.append( {"name": "start", "datatype": dbt_utils.type_timestamp(), "quote": True } ) }}
{% else %}
{{ columns.append( {"name": "end", "datatype": dbt_utils.type_timestamp(), "quote": True } ) }}
{{ columns.append( {"name": "start", "datatype": dbt_utils.type_timestamp() } ) }}
{% endif %}

{{ return(columns) }}

{% endmacro %}
