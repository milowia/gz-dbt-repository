{% macro margin_percent(margin, revenue, round=2) %}
    ROUND( SAFE_DIVIDE({{margin}}, {{revenue}}), {{round}} ) 
{% endmacro %}