from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Wall_post_comment_liked(Base):
    __tablename__ = 'wall_post_comment_liked'
    id_wallpost = Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_liked_user=Column(Integer, primary_key=True, nullable=False)
    id_comment=Column(Integer, primary_key=True, nullable=False)


    def __init__(self,id,wallpost,id_liked_user,id_comment):
        self.id=id
        self.id_wallpost=wallpost
        self.id_liked_user=id_liked_user
        self.id_comment=id_comment