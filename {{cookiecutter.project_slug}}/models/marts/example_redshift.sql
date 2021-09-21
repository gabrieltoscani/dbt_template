with example_redshift as (
    select *
    from {% raw %} "{{ref('dim_example_redshift')}}" {% endraw %}
)

select *
from example_redshift