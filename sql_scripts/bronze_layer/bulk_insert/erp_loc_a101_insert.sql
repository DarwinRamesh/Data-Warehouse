TRUNCATE TABLE bronze.erp_l0c_a101;

COPY bronze.erp_l0c_a101(
    cid,
    cntry
)
FROM '/tmp/Datasets/source_erp/LOC_A101.csv'
DELIMITER ','
CSV HEADER;