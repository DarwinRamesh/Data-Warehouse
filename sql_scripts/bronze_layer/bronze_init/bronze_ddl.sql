-- CRM : Customer Info
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE IF NOT EXISTS bronze.crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(80),
    cst_firstname VARCHAR(80),
    cst_lastname VARCHAR(80),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);
-- CRM : Product Info
DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE IF NOT EXISTS bronze.crm_prd_info(
    prd_id INT,
    prd_key VARCHAR(80),
    prd_nm VARCHAR(80),
    prd_cost INT,
    prd_line VARCHAR(80),
    prd_start_dt DATE,
    prd_end_dt DATE
);
-- CRM : Sales Details
DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE IF NOT EXISTS bronze.crm_sales_details(
    sls_ord_num VARCHAR(80),
    sls_prd_key VARCHAR(80),
    sls_cust_id VARCHAR(80),
    sls_order_dt VARCHAR(80),
    sls_ship_dt VARCHAR(80),
    sls_due_dt VARCHAR(80),
    sls_sales BIGINT,
    sls_quantity BIGINT,
    sls_price BIGINT
);
-- ERP : Customer AZ12
DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE IF NOT EXISTS bronze.erp_cust_az12(
    cid VARCHAR(80),
    bdate VARCHAR,
    gen VARCHAR(80)
);
-- ERP : Location A101
DROP TABLE IF EXISTS bronze.erp_l0c_a101;
CREATE TABLE IF NOT EXISTS bronze.erp_l0c_a101(
    cid VARCHAR(80),
    cntry VARCHAR(80)
);
-- ERP : Product Category G1V2
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE IF NOT EXISTS bronze.erp_px_cat_g1v2(
    id VARCHAR(80),
    cat VARCHAR(80),
    subcat VARCHAR(80),
    maintenance VARCHAR(80)
);