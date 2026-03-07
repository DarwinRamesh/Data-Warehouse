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
    f"{BASE_DIR}/sql_scripts/crm_cust_info_ddl.sql",
    f"{BASE_DIR}/sql_scripts/crm_prd_info_ddl.sql",
    f"{BASE_DIR}/sql_scripts/crm_sales_details_ddl.sql",
    f"{BASE_DIR}/sql_scripts/erp_CUST_AZ12_ddl.sql",
    f"{BASE_DIR}/sql_scripts/erp_LOC_A101_ddl.sql",
    f"{BASE_DIR}/sql_scripts/erp_PX_CAT_G1V2_ddl.sql"
]

INSERT_SCRIPTS = [
    f"{BASE_DIR}/sql_scripts/bulk_insert/crm_cust_info_insert.sql",
    f"{BASE_DIR}/sql_scripts/bulk_insert/crm_prd_info_insert.sql",
    f"{BASE_DIR}/sql_scripts/bulk_insert/crm_sales_details_insert.sql",
    f"{BASE_DIR}/sql_scripts/bulk_insert/erp_CUST_AZ12_insert.sql",
    f"{BASE_DIR}/sql_scripts/bulk_insert/erp_LOC_A101_insert.sql",
    f"{BASE_DIR}/sql_scripts/bulk_insert/erp_PX_CAT_G1V2_insert.sql"
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