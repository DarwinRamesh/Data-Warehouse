TRUNCATE TABLE bronze.erp_cust_az12;

COPY bronze.erp_cust_az12(
    cid,
    bdate,
    gen
)
FROM '/tmp/Datasets/source_erp/CUST_AZ12.csv'
DELIMITER ','
CSV HEADER;