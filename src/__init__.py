import os
import platform

COMMON_SQL_FILE = 'common/sql.yml'
USER_DIR = os.path.expanduser('~')

OS: str = platform.system()
MACOS: bool = (OS == "Darwin")
LINUX: bool = (OS == "Linux")
WINDOWS: bool = (OS == "Windows")
