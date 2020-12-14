from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_school(Base):
    __tablename__ = 'user_school'
    id = Column(Integer, primary_key=True, nullable=False)
    id_num_school=Column(Integer, primary_key=True, nullable=False)
    id_school=Column(Integer)
    id_country=Column(Integer)
    id_city = Column(Integer)
    name = Column(String)
    year_from = Column(Integer)
    year_to=Column(Integer)
    year_graduated=Column(Integer)
    classc=Column(String)
    speciality=Column(String)
    type=Column(String)


    def __init__(self,user_id,num_school, school):
        self.id=user_id
        self.id_num_school=num_school
        self.id_school=school.get('id')
        self.id_country=school.get('country')
        self.id_city=school.get('city')
        self.name=school.get('name')
        self.year_from=school.get('year_from')
        self.year_to= school.get('year_to')
        self.year_graduated= school.get('year_graduated')
        self.classc=school.get('class')
        self.speciality=school.get('speciality')
        self.type=school.get('type')
