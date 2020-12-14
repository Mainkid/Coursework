from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Unit(Base):
    __tablename__ = 'unit'
    unit_id = Column(Integer, primary_key=True, nullable=False)
    title =Column(String)


    def __init__(self,id,title):
        self.unit_id=id
        self.title=title