with staging_schema as (
    select 
        table_schema
        , count(*) as total_tables
    from information_schema.tables
    where table_schema = '{{cookiecutter.target_schema_dev}}' 
    group by table_schema
    )
    , prod_schema as (
    select
        table_schema
        , count(*) as total_tables
    from information_schema.tables
    where table_schema = 'public' 
    group by table_schema
    )

    select *
    from staging_schema
    where total_tables = (select total_tables from prod_schema)