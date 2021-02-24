from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class City(Base):
    __tablename__ = 'city'
    id_city = Column(Integer, primary_key=True, nullable=False)
    title = Column(String)

    def __init__(self, id_city,title):
        self.id_city=id_city
        self.title=title