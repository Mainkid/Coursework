from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Wall_post_reposted(Base):
    __tablename__ = 'wall_post_reposted'
    id_wallpost = Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_reposted_user=Column(Integer, primary_key=True, nullable=False)


    def __init__(self,id,wallpost,id_reposted_user):
        self.id=id
        self.id_wallpost=wallpost
        self.id_reposted_user=id_reposted_user
