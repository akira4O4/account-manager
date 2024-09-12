import os
import yaml
from src import OS, MACOS, LINUX, WINDOWS, USER_DIR


def load_yaml(path: str):
    with open(path, encoding='utf-8') as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
    return data


def load_sql_file(file_path: str):
    with open(file_path, 'r') as file:
        sql = file.read()
    return sql


def create_db_file() -> str:
    if WINDOWS:
        db_file = os.path.join(USER_DIR, '.ac', 'db.db')
    elif LINUX or MACOS:
        db_file = os.path.join(USER_DIR, '.ac', 'db.db')
    else:
        raise ValueError(f"Unsupported system: {OS}")
    return db_file
