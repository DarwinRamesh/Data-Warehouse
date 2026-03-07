TRUNCATE TABLE bronze.crm_sales_details;
CREATE TEMP TABLE stg_crm_sales AS
SELECT * FROM bronze.crm_sales_details LIMIT 0;

ALTER TABLE stg_crm_sales
    ALTER COLUMN sls_order_dt TYPE TEXT,
    ALTER COLUMN sls_ship_dt TYPE TEXT,
    ALTER COLUMN sls_due_dt TYPE TEXT;

COPY stg_crm_sales(
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
FROM '/tmp/Datasets/source_crm/sales_details.csv'
DELIMITER ',' CSV HEADER;

TRUNCATE TABLE bronze.crm_sales_details;

INSERT INTO bronze.crm_sales_details
SELECT
    sls_ord_num, sls_prd_key, sls_cust_id,
    CASE 
        WHEN sls_order_dt ~ '^\d+$' 
        THEN (DATE '1899-12-30' + CAST(sls_order_dt AS INT))
        ELSE CAST(NULLIF(sls_order_dt, '0') AS DATE)
    END,
    CASE 
        WHEN sls_ship_dt ~ '^\d+$' 
        THEN (DATE '1899-12-30' + CAST(sls_ship_dt AS INT))
        ELSE CAST(NULLIF(sls_ship_dt, '0') AS DATE)
    END,
    CASE 
        WHEN sls_due_dt ~ '^\d+$' 
        THEN (DATE '1899-12-30' + CAST(sls_due_dt AS INT))
        ELSE CAST(NULLIF(sls_due_dt, '0') AS DATE)
    END,
    sls_sales, sls_quantity, sls_price
FROM stg_crm_sales;
