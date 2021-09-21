with first_example as (
    select *
    from
        {% raw %} "{{ ref('example_postgres') }}" {% endraw %}
),

second_example as (
    select *
    from {% raw %} "{{ref('second_example_postgres')}}" {% endraw %}
),

joined as (
    select *
    from first_example
    left join second_example on first_example.id = second_example.id
)

select *
from joined