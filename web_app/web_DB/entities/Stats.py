from sqlalchemy import Column, Integer
from web_app.web_DB.entities.Base import Base


class Stats(Base):
    __tablename__ = 'stats'
    successfully = Column(Integer, nullable=False)
    failed = Column(Integer, nullable=False)
    id=Column(Integer,primary_key=True)

    def __init__(self, success,fail):
        self.successfully=success
        self.failed=fail