import os
import sqlite3
from loguru import logger


class Sqlite3DB:
    def __init__(self, db_path: str):
        self.db_pth = db_path
        self.conn = None
        self.cursor = None

        if os.path.exists(self.db_pth) is False:
            db_dir, db_file = os.path.split(self.db_pth)
            os.makedirs(db_dir)
        self._connect()

    def _connect(self) -> None:
        if self.conn is None:
            self.conn = sqlite3.connect(self.db_pth)
            self.cursor = self.conn.cursor()
            logger.success(f'Connected to database: {self.db_pth}.')

    def _commit_and_close(self) -> None:
        if self.conn:
            try:
                self.conn.commit()
                logger.success('Commit.')
            except sqlite3.Error as e:
                logger.error(f"Failed to commit transaction: {e}.")
            finally:
                self.conn.close()
                self.conn = None
                self.cursor = None
                logger.success(f'Database connection closed.')

    def execute(self, *args, **kwargs) -> None:
        try:
            self._connect()
            self.cursor.execute(*args, **kwargs)
            self._commit_and_close()

        except sqlite3.Error as e:
            logger.error(f"Database operation failed: {e}")
            if self.conn:
                self.conn.rollback()  # 回滚事务

    def check_table_exists(self, table_name: str) -> bool:
        try:
            self._connect()
            self.cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?;", (table_name,))
            result = self.cursor.fetchone()
            if result:
                logger.info(f"Table: {table_name} is found.")
                return True
            else:
                logger.info(f"Table: '{table_name}' is not found.")
                return False
        except sqlite3.Error as e:
            logger.error(f"Failed to check table existence: {e}")
            return False
