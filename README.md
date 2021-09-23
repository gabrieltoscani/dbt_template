# Cookiecutter dbt

Powered by Cookiecutter, Cookiecutter dbt is a framework for jumpstarting production-ready dbt projects quickly.

## Features

* For dbt >= 0.18.0
* Works with Python 3.8
* SQLFluff linting
* Pre-built example models and tests 

## Installation

### Using Cookiecutter CLI

```
pip install "cookiecutter>=1.7.0"
cookiecutter gh:datacoves/cookiecutter-dbt
```

## Usage

* The `models/staging` folder is where we will apply most of the data cleaning and business rules
* The `models/staging_marts` folder is the staging area for our data marts. Here we build the tables that will feed the Data Warehouse, such as facts and dimension tables.
* In the `models/marts` the models will consist of `select * from staging_marts_table`, meaning that if we have a `stg_fact_table` in the `staging_marts` folder, it will need a counterpart in the `marts` folder built as `select * from {{ref('stg_fact_table'}}`

## Reasoning

In an ideal dbt pipeline, we want to run all the models targeted to a development schema, test them and only after run to the prod schema. In this structure, all models in the staging and staging_marts folder are [tagged](https://docs.getdbt.com/reference/resource-configs/tags) as staging and models in the marts folder are tagged as prod. This way, we can run and test all our staging using `dbt run --models tag:staging` and `dbt test --models tag:staging`. 

Having the production tables separated in a different environment and built as simple selects from the staging area prevents running possibly heavy processes twice, while removing the need to test again because the tables are exact the same as the previously tested ones. To ensure all tables exist in staging_marts and marts folder, we developed a test to compare the total tables in both schemas, which should be equal. This way, a CI/CD pipeline will not allow conflicting information between staging_marts and marts.