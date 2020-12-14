from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import  datetime

class User_occupation(Base):
    __tablename__ = 'user_occupation'
    id = Column(Integer, primary_key=True, nullable=False)
    type=Column(String)
    id_occupation=Column(Integer)
    name=Column(String)

    def __init__(self,id,occupation):
        self.id=id
        self.type=occupation.get('type')
        self.id_occupation=occupation.get('id')
        self.name=occupation.get('name')