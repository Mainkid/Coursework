from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class Object_comment_attachments(Base):
    __tablename__ = 'object_comment_attachments'
    id_object = Column(Integer, primary_key=True, nullable=False)
    id_comment = Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_attachment_num=Column(Integer, primary_key=True, nullable=False)
    attachment_url=Column(String)
    type=Column(String)
    object_type=Column(String, primary_key=True, nullable=False)


    def __init__(self,user_id,id_comment,attachment_num,id_object,attachment_type,url,object_type):
        self.id_object=id_object
        self.id=user_id
        self.id_comment=id_comment
        self.id_attachment_num=attachment_num
        self.type=attachment_type
        self.attachment_url=url
        self.object_type= object_type