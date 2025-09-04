from sqlalchemy import text, Engine
from tabulate import tabulate
from pathlib import Path
from typing import List, Dict

def load_sql(filename: str) -> str:
    """SQL dosyasını oku"""
    sql_path = Path("sql") / filename
    with open(sql_path, "r", encoding="utf-8") as f:
        return f.read()

def run_query(engine: Engine, sql_file: str) -> List[Dict]:
    """SQL dosyasını çalıştır ve sonucu return et"""
    query = load_sql(sql_file)
    with engine.connect() as conn:
        result = conn.execute(text(query)).mappings().all()
    return result

def print_result(result, title="Sonuç")-> None:
    """Terminalde tablo formatında yazdır"""
    print(f"\n📊 {title}")
    print(tabulate(result, headers="keys", tablefmt="psql"))
