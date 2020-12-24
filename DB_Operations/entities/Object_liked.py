from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Object_liked(Base):
    __tablename__ = 'object_liked'
    id_object= Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_liked_user=Column(Integer, primary_key=True, nullable=False)
    object_type=Column(String, primary_key=True, nullable=False)


    def __init__(self,id,object,id_liked_user,object_type):
        self.id=id
        self.id_object=object
        self.id_liked_user=id_liked_user
        self.object_type=object_type
