from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_friends(Base):
    __tablename__ = 'user_friends'
    id = Column(Integer, primary_key=True, nullable=False)
    id_friend = Column(Integer, primary_key=True, nullable=False)

    def __init__(self,id,id_friend):
        self.id=id
        self.id_friend=id_friend