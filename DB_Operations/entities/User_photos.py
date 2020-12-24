from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime


class User_photos(Base):
    __tablename__ = 'user_photos'
    id = Column(Integer, primary_key=True, nullable=False)
    id_photo=Column(Integer, primary_key=True, nullable=False)
    album_id=Column(Integer)
    owner_id=Column(Integer)
    post_id=Column(Integer)
    text=Column(String)
    date=Column(DateTime)
    url=Column(String)


    def __init__(self,id,photo):
        self.id=id
        self.id_photo=photo.get('id')
        self.album_id=photo.get('album_id')
        self.owner_id=photo.get('owner_id')
        self.post_id=photo.get('post_id')
        self.text=photo.get('text')
        self.date=datetime.utcfromtimestamp((photo.get('date'))).strftime('%Y-%m-%d %H:%M:%S')
        arr=photo.get('sizes')
        self.url=arr[len(arr)-1].get('url')