{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {# If no custom schema is defined, use the default target schema #}
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    
    {# If a custom schema (like 'elementary') is defined, use it directly without prefixing #}
    {%- else -%}
        {{ custom_schema_name }}
    {%- endif -%}
  
{%- endmacro %}