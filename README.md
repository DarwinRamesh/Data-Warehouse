# Data-Warehouse

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