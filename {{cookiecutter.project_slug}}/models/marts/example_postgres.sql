with example_postgres as (
    select *
    from {% raw %} "{{ref('dim_example_postgres')}}" {% endraw %}
)

select *
from example_postgres