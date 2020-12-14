from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Wall_post_attachments(Base):
    __tablename__ = 'wall_post_attachments'
    id_wall_post = Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_attachment_num=Column(Integer, primary_key=True, nullable=False)
    attachment_url=Column(String)
    type=Column(String)


    def __init__(self,user_id,attachment_num,id_wall_post,attachment_type,url):
        self.id_wall_post=id_wall_post
        self.id=user_id
        self.id_attachment_num=attachment_num
        self.type=attachment_type
        self.attachment_url=url


