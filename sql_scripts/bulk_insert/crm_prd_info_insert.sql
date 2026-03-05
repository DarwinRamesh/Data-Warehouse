TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info(
    prd_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
FROM '/tmp/Datasets/source_crm/prd_info.csv'
DELIMITER ','
CSV HEADER;