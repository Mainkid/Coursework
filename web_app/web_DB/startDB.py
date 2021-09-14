from sqlalchemy import MetaData, create_engine
from sqlalchemy.orm import sessionmaker
from web_app.web_DB.entities.Base import Base
import configparser

class startDB:

    session= None
    success=0
    failed=0
    @staticmethod
    def connect():
        config = configparser.ConfigParser()  # создаём объекта парсера
        config.read(r"web_db_config.ini")  # читаем конфиг
        if config["docker"]["using_docker"] == '1':
            cn_str = 'postgresql+psycopg2://' + config["postgres_docker"]["user"] + ':' + config["postgres_docker"]["password"] + '@' + config["postgres_docker"]["host"] + '/' + config["postgres_docker"]["database"]
        else:
            cn_str = 'postgresql+psycopg2://' + config["postgres"]["user"] + ':' + config["postgres"][
                "password"] + '@' + config["postgres"]["host"] + '/' + config["postgres"]["database"]
        engine = create_engine(cn_str, echo=False)
        metadata = MetaData()
        Base.metadata.create_all(engine)
        _session = sessionmaker(bind=engine)
        startDB.session= _session()
        startDB.session.query
        print("Web database opened successfully")
