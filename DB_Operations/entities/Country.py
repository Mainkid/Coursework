from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_university(Base):
    __tablename__ = 'country'
    id_country = Column(Integer, primary_key=True, nullable=False)
    title = Column(String)