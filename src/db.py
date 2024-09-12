import os
import sqlite3
from loguru import logger


class Sqlite3DB:
    def __init__(self, db_path: str):
        self.db_pth = db_path
        self.conn = None
        self.cursor = None

    def connect(self) -> None:
        if os.path.exists(self.db_pth) is False:
            logger.info(f'Create DB: {self.db_pth}.')

        self.conn = sqlite3.connect(self.db_pth)
        logger.success(f'Connect database: {self.db_pth}.')

        self.get_cursor()

    def get_cursor(self):
        self.cursor = self.conn.cursor()

    def execute(self, sql_string: str):
        self.cursor.execute(sql_string)
        logger.info(f'Execute sql string: {sql_string}.')

    def check_table_exists(self, table_name: str) -> bool:
        self.cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}';")
        result = self.cursor.fetchone()
        if result:
            logger.info(f"Table: {table_name} is found.")
        else:
            logger.info(f"Table: '{table_name}' is not found.")

        return result

    def insert_login(self, user_name: str, password: str, emial: str):
        ...
