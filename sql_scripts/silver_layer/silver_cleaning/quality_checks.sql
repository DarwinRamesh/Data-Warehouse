--Checking for duplicate customer IDs in the bronze layer

SELECT prd_id, count(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING count(*) > 1

-- Checking for unwanted spaces

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != trim(prd_nm);

-- Checking for invalid dates

SELECT * FROM bronze.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt