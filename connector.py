from sqlalchemy import create_engine, Engine
from typing import Dict

def get_engine(db_config: Dict[str, str]) -> Engine:
    return create_engine(
        f"postgresql+psycopg2://{db_config['user']}:{db_config['password']}@{db_config['host']}:{db_config['port']}/{db_config['database']}"
    )
