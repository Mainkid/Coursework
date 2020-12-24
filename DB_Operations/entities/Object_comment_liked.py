from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Object_comment_liked(Base):
    __tablename__ = 'object_comment_liked'
    id_object= Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_liked_user=Column(Integer, primary_key=True, nullable=False)
    id_comment=Column(Integer, primary_key=True, nullable=False)
    object_type=Column(String, primary_key=True, nullable=False)


    def __init__(self,id,object,id_liked_user,id_comment,object_type):
        self.id=id
        self.id_object=object
        self.id_liked_user=id_liked_user
        self.id_comment=id_comment
        self.object_type=object_type