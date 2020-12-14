import psycopg2
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey, create_engine
from sqlalchemy.orm import sessionmaker

from DB_Operations.entities.Base import Base
from DB_Operations.entities.User import User
import configparser



config = configparser.ConfigParser()  # создаём объекта парсера
config.read(r"config.ini")  # читаем конфиг

cn_str='postgresql+psycopg2://'+config["postgres"]["user"]+':'+config["postgres"]["password"]+'@'+config["postgres"]["host"]+'/'+config["postgres"]["database"]
# Чтение конфиг файла добавить
engine = create_engine(cn_str, echo=False)
metadata=MetaData()
Base.metadata.create_all(engine)
_session = sessionmaker(bind=engine)
session = _session()
session.query
print("Database opened successfully")