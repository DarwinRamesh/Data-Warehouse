TRUNCATE TABLE silver.crm_sales_details;
INSERT INTO silver.crm_sales_details(
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)
SELECT
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    CASE
        WHEN sls_order_dt = '0' OR LENGTH(sls_order_dt) != 8 THEN NULL
        ELSE TO_DATE(sls_order_dt, 'YYYYMMDD')
    END AS sls_order_dt,
    CASE 
        WHEN sls_ship_dt = '0' OR LENGTH(sls_ship_dt) != 8 THEN NULL
        ELSE TO_DATE(sls_ship_dt, 'YYYYMMDD')
    END AS sls_ship_dt,
    CASE 
        WHEN sls_due_dt = '0' OR LENGTH(sls_due_dt) != 8 THEN NULL
        ELSE TO_DATE(sls_due_dt, 'YYYYMMDD')
    END AS sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
FROM bronze.crm_sales_details;