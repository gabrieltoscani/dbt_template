with first_example as (
    select *
    from
        {% raw %} "{{ ref('example_postgres') }}" {% endraw %}
)

select *
from first_example