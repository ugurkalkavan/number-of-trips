import pandas as pd
from sqlalchemy import Engine


def load_csv_to_postgres(engine: Engine, csv_file: str, table_name: str, if_exists: str = "replace") -> None:
    df = pd.read_csv(csv_file, sep=';')
    df.to_sql(table_name, engine, if_exists=if_exists, index=False)
    print(f"\n {table_name} tablosuna {len(df)} satır yazıldı.\n")
