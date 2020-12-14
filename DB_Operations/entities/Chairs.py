from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Chairs(Base):
    __tablename__ = 'chairs'
    id_chair = Column(Integer, primary_key=True, nullable=False)
    chair = Column(String)