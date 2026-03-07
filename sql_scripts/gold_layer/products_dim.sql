DROP VIEW IF EXISTS gold.dim_products;
CREATE VIEW gold.dim_products AS
SELECT
    ROW_NUMBER() OVER (ORDER BY pn.prd_start_dt, pn.prd_id) AS product_key,
    pn.prd_id AS product_id,
    pn.prd_key,
    pn.prd_nm AS product_name,
    pn.prd_cost AS product_cost,
    pn.prd_line AS product_line,
    pn.prd_start_dt as product_start_date,
    pc.id AS category_id,
    pc.cat AS category_name,
    pc.subcat AS subcategory_name,
    pc.maintenance AS maintenance_flag
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
    ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL;
