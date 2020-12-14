from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_university(Base):
    __tablename__ = 'user_university'
    id = Column(Integer, primary_key=True, nullable=False)
    id_num_university = Column(Integer, primary_key=True, nullable=False)
    id_university=Column(Integer)
    id_faculty = Column(Integer)
    graduation = Column(Integer)
    id_chair = Column(Integer)
    education_form = Column(String)
    education_status = Column(String)



    def __init__(self,user_id,num_univer,univer):
        self.id=user_id
        self.id_num_university=num_univer
        self.id_university=univer.get('id')
        self.id_faculty=univer.get('faculty')
        self.graduation=univer.get('graduation')
        self.id_chair=univer.get('chair')
        self.education_form=univer.get('education_form')
        self.education_status=univer.get('education_status')
