from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import  datetime

class Wall_post_comments(Base):
    __tablename__ = 'wall_post_comments'
    id = Column(Integer, primary_key=True, nullable=False)
    id_comment = Column(Integer, primary_key=True, nullable=False)
    id_wallpost=Column(Integer, primary_key=True, nullable=False)
    id_from=Column(Integer)
    date=Column(DateTime)
    text=Column(String)
    reply_to_user=Column(Integer)
    reply_to_comment=Column(Integer)
    date_of_collection=Column(DateTime)
    parent_stack=Column(Integer)


    def __init__(self,id,id_wallpost,comment):
        self.id=id
        self.id_wallpost=id_wallpost
        self.id_comment=comment.get('id')
        self.id_from=comment.get('from_id')
        self.date=datetime.utcfromtimestamp((comment.get('date'))).strftime('%Y-%m-%d %H:%M:%S')
        self.text=comment.get('text')
        self.reply_to_user=comment.get('reply_to_user')
        self.reply_to_comment=comment.get('reply_to_comment')
        self.date_of_collection=datetime.now()
        arr=comment.get('parent_stack')
        if (arr is not None):
            self.parent_stack=arr[0]