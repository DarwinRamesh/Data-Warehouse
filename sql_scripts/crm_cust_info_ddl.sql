-- Active: 1772113886541@@127.0.0.1@5432@database_warehouse
CREATE TABLE IF NOT EXISTS bronze.crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(80),
    cst_firstname VARCHAR(80),
    cst_lastname VARCHAR(80),
    cst_marital_status VARCHAR(5),
    cst_gndr VARCHAR(5),
    cst_create_date DATE
);