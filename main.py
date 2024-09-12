import os
from src import COMMON_SQL_FILE
from src.db import Sqlite3DB
from src.utils import load_yaml

if __name__ == '__main__':
    common_sql = load_yaml(COMMON_SQL_FILE)

    db = Sqlite3DB('./temp/password.db')
    db.connect()
    if not db.check_table_exists('user'):
        db.execute(common_sql['create_user_table'])
    if not db.check_table_exists('password'):
        db.execute(common_sql['create_password_table'])
