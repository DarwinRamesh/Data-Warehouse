TRUNCATE TABLE bronze.crm_cust_info;

COPY bronze.crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_marital_status,
    cst_gndr,
    cst_create_date
)
FROM '/tmp/Datasets/source_crm/cust_info.csv'
DELIMITER ','
CSV HEADER;
