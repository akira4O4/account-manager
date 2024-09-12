import os
from dotenv import load_dotenv
from src import COMMON_SQL_FILE
from src.db import Sqlite3DB
from src.utils import load_yaml

if __name__ == '__main__':
    load_dotenv()

    cmd = load_yaml(COMMON_SQL_FILE)
    db = Sqlite3DB(os.getenv("DB_PATH"))

    if not db.check_table_exists('user'):
        db.execute(cmd['create_user_table'])
    if not db.check_table_exists('password'):
        db.execute(cmd['create_password_table'])

    # user_name, password
    db.execute(cmd['insert_user_data'], ('user0', 'abc'))
    # user_name, password, email
    db.execute(cmd['insert_password_data'],('user','0000','user@abc.com'))
