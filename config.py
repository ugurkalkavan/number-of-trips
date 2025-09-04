from dotenv import load_dotenv
import os
from typing import Dict

load_dotenv()

def get_db_config() -> Dict[str, str]:
    return {
        "user": os.getenv("DB_USER", "postgres"),
        "password": os.getenv("DB_PASS", ""),
        "host": os.getenv("DB_HOST", "localhost"),
        "port": os.getenv("DB_PORT", "5432"),
        "database": os.getenv("DB_NAME", "mydb"),
    }
