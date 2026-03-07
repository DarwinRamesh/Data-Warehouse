# Data-Warehouse

This project is a primitive data warehouse built with postgres and python. It is a project meant for self-learning. It is semi-automated and can handle new batch data ingestion without failure so long as the data's dirtiness remains within constraints. 

It was built with the medallion architecture and covers the bronze, silver and gold layer with automated scripts for the bronze and silver layers ( for the ingestion and cleaning of raw data. )

![Architecture Diagram](Data-Warehouse/system_architeture_plan.png)

## Project Structure

```
Data-Warehouse/
├── Datasets/                        # Source CSV files
│   └── source_crm/
│   └── source_erp/
├── python_scripts/                  # Automation scripts
│   ├── bronze_layer_automation.py
│   └── silver_layer_automation.py
├── sql_scripts/
│   ├── bronze_layer/
│   │   ├── bronze_ddl.sql
│   │   └── bulk_insert/
│   ├── silver_layer/
│   │   ├── silver_init/
│   │   └── silver_cleaning/
│   └── gold_layer/
│       ├── customers_dim.sql
│       ├── products_dim.sql
│       └── fact_sales.sql
└── README.md
```
## Tech Stack

- **Database**: PostgreSQL
- **Automation**: Python 3 with `psycopg` and `python-dotenv`

Conventions used for the project

- Snakcase naming ( eg. main_file.py, calculate_limit.cpp )
- Developed incrementally with Git version control
- Language : English only

Bronze Rules

- Names must start with source system name and table names must match their original names
- **`<sourcesystem>_<entity>`**
    - **`<sourcesystem>`** : Name from the source file of said data
    - **`<entity>`** : Name of the referenced table, must match exactly
        - Example : **`crm_car_sales`** is named the way it is because it is from the `crm` raw data .csv and the table is named, in this case `car_sales`.

Silver Rules

- Names must start with source system name and table names must match their original names
- **`<sourcesystem>_<entity>`**
    - **`<sourcesystem>`** : Name from the source file of said data
    - **`<entity>`** : Name of the referenced table, must match exactly
        - Example : **`crm_car_sales`** is named the way it is because it is from the `crm` raw data .csv and the table is named, in this case `car_sales`.

Gold Rules

- All names must be meaningfuland business aligned for table, starting with prefixes based onh category. 
- **`<category>_<entity>`**
    - **`<cateogory> `**: Describes the role of the table, such as **`<dim>`** for dimension or **`<fact>`** for factsheets. 
    - **`<entity>`** : Descriptive name of the table aligned with the business domain (eg. **`<customers>`**, **`<product>`**, **<sales>**)

        - Examples:
            - **`<customers>`** refers to a table for customers data
            - **`<product>`** refers to a products data

Glossary of Category Patterns

| Pattern | Meaning | Example(s) |
|---|---| --- |
| **`dim_`** | Dimension | **`dim_date`**, **`dim_location`**|
| **`fact`** | Factsheet | **`fact_sales`**|
| **`report_`** | Report | **`report_customers`**, `report_users`| 

## Column naming conventions

### Surrogate Keys

- All primary keys in the dimension table must end with **`-key`**
- **`<table_name>`**_**`key`**

### Technical columns

- All technical columns must by preceded with the prefix **`dwh_`** and followed by a name that describes the pupose of the table
- **`dwh_columnname`**

## Stored procedure

- All stored procedures must be preceded by **`load_`** and followed by the layer being loaded (eg. **`silver`**, **`gold`**, **`bronze`**)


