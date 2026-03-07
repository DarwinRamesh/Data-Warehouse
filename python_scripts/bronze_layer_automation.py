from dotenv import load_dotenv
import psycopg
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "dbname": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "port": os.getenv("DB_PORT")
}

DDL_SCRIPTS = [
    f"{BASE_DIR}/sql_scripts/bronze_layer/bronze_init/bronze_ddl.sql",
]

INSERT_SCRIPTS = [
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/crm_cust_info_insert.sql",
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/crm_prd_info_insert.sql",
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/crm_sales_details_insert.sql",
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/erp_cust_az12_insert.sql",
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/erp_loc_a101_insert.sql",
    f"{BASE_DIR}/sql_scripts/bronze_layer/bulk_insert/erp_px_cat_g1v2_insert.sql"
]

def run_script(conn, filepath):
    with open(filepath, 'r') as f:
        sql = f.read()
    with conn.cursor() as cur:
        cur.execute(sql)
    conn.commit()
    print(f"✓ {filepath}")

def main():
    with psycopg.connect(**DB_CONFIG) as conn:
        print("Running DDL scripts...")
        for script in DDL_SCRIPTS:
            run_script(conn, script)

        print("Running insert scripts...")
        for script in INSERT_SCRIPTS:
            run_script(conn, script)

    print("Done.")

print("DB_USER:", os.getenv("DB_USER"))
print("DB_NAME:", os.getenv("DB_NAME"))

if __name__ == "__main__":
    print("Starting Bronze Layer Automation...")
    main()