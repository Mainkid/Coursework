from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Country(Base):
    __tablename__ = 'country'
    id_country = Column(Integer, primary_key=True, nullable=False)
    title = Column(String)


    def __init__(self,id,title):
        self.id_country=id
        self.title=title