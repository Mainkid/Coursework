from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Universities(Base):
    __tablename__ = 'universities'
    id_university = Column(Integer, primary_key=True, nullable=False)
    university_name = Column(String)