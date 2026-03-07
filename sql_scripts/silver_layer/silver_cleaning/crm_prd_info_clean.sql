TRUNCATE TABLE silver.crm_prd_info;
INSERT INTO silver.crm_prd_info(
    prd_id,
    prd_key,
    cat_id,
    subcat_id,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
SELECT 
    prd_id,
    prd_key,
    REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_id,
    substring(prd_key, 7, LENGTH(prd_key)) AS subcat_id,
    prd_nm,
    COALESCE(prd_cost, 0) AS prd_cost,
    CASE 
        WHEN UPPER(TRIM(prd_line)) = 'R' THEN  'Road' 
        WHEN UPPER(TRIM(prd_line)) = 'M' THEN  'Mountain'
        WHEN UPPER(TRIM(prd_line)) = 'T' THEN  'Touring'
        WHEN UPPER(TRIM(prd_line)) = 'S' THEN  'Sport'
        ELSE 'N/A'
    END AS prd_line,
    CAST (prd_start_dt AS DATE) AS prd_start_dt,
    CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) AS DATE) AS prd_end_dt
FROM bronze.crm_prd_info LIMIT 10;

