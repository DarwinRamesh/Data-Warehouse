CREATE TABLE IF NOT EXISTS bronze.crm_sales_details(
    sls_ord_num VARCHAR(80),
    sls_prd_key VARCHAR(80),
    sls_cust_id BIGINT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales BIGINT,
    sls_price BIGINT
);