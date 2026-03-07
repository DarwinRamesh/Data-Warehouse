TRUNCATE TABLE silver.erp_cust_az12;
INSERT INTO silver.erp_cust_az12(
    cid,
    bdate,
    gen
)
SELECT
CASE 
    WHEN cid LIKE 'NAS%' THEN substring(cid, 4)
    ELSE cid
END AS cid,
CAST(bdate AS DATE) AS bdate,
CASE 
    WHEN gen = 'Male' THEN 'Male'
    WHEN gen = 'Female' THEN 'Female'
    ELSE 'N/A'
END AS gen
FROM bronze.erp_cust_az12;
