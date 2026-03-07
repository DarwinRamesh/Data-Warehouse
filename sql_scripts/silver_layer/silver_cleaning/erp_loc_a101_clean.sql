TRUNCATE TABLE silver.erp_l0c_a101;
INSERT into silver.erp_l0c_a101(
    cid,
    cntry
)
SELECT
    REPLACE(cid, '-', '') AS cid,
    CASE
        WHEN UPPER(TRIM(cntry)) ='DE' THEN 'Germany'
        ELSE cntry
    END as cntry
FROM bronze.erp_l0c_a101;

SELECT * FROM silver.erp_l0c_a101;