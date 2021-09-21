with example_bigquery as (
    select *
    from {% raw %} "{{ref('dim_example_bigquery')}}" {% endraw %}
)

select *
from example_bigquery