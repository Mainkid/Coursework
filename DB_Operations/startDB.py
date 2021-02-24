import psycopg2
from sqlalchemy import Table, Column, Integer, String, MetaData, ForeignKey, create_engine
from sqlalchemy.orm import sessionmaker,session

from DB_Operations.entities.Base import Base
import configparser

class startDB:

    session= None

    @staticmethod
    def connect():
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"db_config.ini")  # читаем конфиг
        if config["docker"]["using_docker"]!='1':
            cn_str = 'postgresql+psycopg2://' + config["postgres"]["user"] + ':' + config["postgres"]["password"] + '@' + \
            config["postgres"]["host"] + '/' + config["postgres"]["database"]
        else:
            cn_str='postgresql+psycopg2://' + config["postgres_docker"]["user"] + ':' + config["postgres_docker"]["password"] + '@' + \
            config["postgres_docker"]["host"] + '/' + config["postgres_docker"]["database"]
        engine = create_engine(cn_str, echo=False)
        metadata = MetaData()
        Base.metadata.create_all(engine)
        _session = sessionmaker(bind=engine)
        startDB.session= _session()
        startDB.session.query
        print("Database opened successfully")
