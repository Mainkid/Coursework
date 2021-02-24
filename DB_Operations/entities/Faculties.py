from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Faculties(Base):
    __tablename__ = 'faculties'
    id_faculty = Column(Integer, primary_key=True, nullable=False)
    faculty_name = Column(String)

    def __init__(self, id_fac,fac_name):
        self.id_faculty=id_fac
        self.faculty_name=fac_name