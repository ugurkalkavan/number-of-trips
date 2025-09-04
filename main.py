from connector import get_engine
from loader import load_csv_to_postgres
from queries import run_query, print_result

from config import get_db_config
from connector import get_engine

def main():
    db_config = get_db_config()
    engine = get_engine(db_config)
    table_name = "trips"
    csv_file = "data/output.csv"

    # 1. CSV → Postgre
    load_csv_to_postgres(engine, csv_file, table_name)

    # 2. SQL sorgularını çalıştır
    result1 = run_query(engine, "query1.sql")
    result2 = run_query(engine, "query2.sql")

    # 3. Sonuçları yazdır
    print_result(result1, "Query1 Sonucu")
    print_result(result2, "Query2 Sonucu")

if __name__ == "__main__":
    main()
