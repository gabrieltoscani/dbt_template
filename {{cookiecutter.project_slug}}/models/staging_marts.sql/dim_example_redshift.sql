with first_example as (
    select *
    from
        {% raw %} "{ ref('example_redshift') }}" {% endraw %}
),

second_example as (
    select *
    from {% raw %} "{{ref('second_example_redshift')}}" {% endraw %} 
),

joined as (
    select *
    from first_example
    left join second_example on first_example.id = second_example.id
)

select *
from joined