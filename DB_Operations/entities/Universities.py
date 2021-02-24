from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Universities(Base):
    __tablename__ = 'universities'
    id_university = Column(Integer, primary_key=True, nullable=False)
    university_name = Column(String)

    def __init__(self,id,title):
        self.id_university=id
        self.university_name=title