--Checking for duplicate customer IDs in the bronze layer

SELECT cst_id, count(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING count(*) > 1

-- Checking for unwanted spaces

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != trim(cst_firstname);

TRUNCATE TABLE silver.crm_cust_info;
INSERT INTO silver.crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
SELECT
    cst_id,
    cst_key,
    trim(cst_firstname) as cst_firstname,
    trim(cst_lastname) as cst_lastname,
CASE 
    WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male' 
    WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
    ELSE 'N/A'
END 
cst_gndr,
CASE 
    WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single' 
    WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
    ELSE 'N/A'
END 
cst_marital_status,
cst_create_date
FROM(
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
    WHERE cst_id IS NOT NULL
)T WHERE flag_last = 1;


    

