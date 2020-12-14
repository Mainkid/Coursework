from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_relatives(Base):
    __tablename__ = 'user_relatives'
    id = Column(Integer, primary_key=True, nullable=False)
    id_num_relative=Column(Integer, primary_key=True, nullable=False)
    id_user=Column(Integer)
    name=Column(String)
    type=Column(String)


    def __init__(self,id,id_num,relative):
        self.id=id
        self.id_num_relative=id_num
        if relative.get('id')>0:
            self.id_user=relative.get('id')
        self.name=relative.get('name')
        self.type=relative.get('type')