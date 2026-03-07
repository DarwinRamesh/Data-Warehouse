TRUNCATE TABLE bronze.erp_px_cat_g1v2;

COPY bronze.erp_px_cat_g1v2(
    id,
    cat,
    subcat,
    maintenance
)
FROM '/tmp/Datasets/source_erp/PX_CAT_G1V2.csv'
DELIMITER ','
CSV HEADER;