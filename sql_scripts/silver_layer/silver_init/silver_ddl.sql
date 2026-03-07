-- CRM : Customer Info
CREATE TABLE IF NOT EXISTS silver.crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(80),
    cst_firstname VARCHAR(80),
    cst_lastname VARCHAR(80),
    cst_marital_status VARCHAR(5),
    cst_gndr VARCHAR(5),
    cst_create_date DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- CRM : Product Info
CREATE TABLE IF NOT EXISTS silver.crm_prd_info( 
    prd_id INT,
    prd_key VARCHAR(80),
    prd_nm VARCHAR(80),
    prd_cost INT,
    prd_line VARCHAR(80),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 
-- CRM : Sales Details
CREATE TABLE IF NOT EXISTS silver.crm_sales_details(
    sls_ord_num VARCHAR(80),
    sls_prd_key VARCHAR(80),
    sls_cust_id BIGINT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales BIGINT,
    sls_price BIGINT,
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ERP : Customer AZ12
CREATE TABLE IF NOT EXISTS silver.erp_cust_az12(
    cid VARCHAR(80),
    bdate DATE,
    gen VARCHAR(80),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ERP : Location A101
CREATE TABLE IF NOT EXISTS silver.erp_l0c_a101(
    cid VARCHAR(80),
    cntry VARCHAR(80),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ERP : Product Category G1V2
CREATE TABLE IF NOT EXISTS silver.erp_px_cat_g1v2(
    id VARCHAR(80),
    cat VARCHAR(80),
    subcat VARCHAR(80),
    maintenance VARCHAR(80),
    dwh_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

