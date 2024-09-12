import yaml


def load_yaml(path: str):
    with open(path, encoding='utf-8') as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
    return data


def load_sql_file(file_path: str):
    with open(file_path, 'r') as file:
        sql = file.read()
    return sql
