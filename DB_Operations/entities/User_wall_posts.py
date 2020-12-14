from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base
from datetime import datetime

class User_wall_posts(Base):
    __tablename__ = 'user_wall_posts'
    id_wallpost = Column(Integer, primary_key=True, nullable=False)
    id=Column(Integer, primary_key=True, nullable=False)
    id_from=Column(Integer)
    date=Column(Date)
    text=Column(String)
    reply_owner_id=Column(Integer)
    reply_post_id=Column(Integer)
    friends_only=Column(Boolean)
    comments_count=Column(Integer)
    copyright=Column(String)
    likes_count=Column(Integer)
    like_user_likes=Column(Boolean)
    reposts_count=Column(Integer)
    views=Column(Integer)
    post_type=Column(String)
    geo_type=Column(String)
    geo_coordinates=Column(String)
    id_place=Column(Integer)
    is_pinned=Column(Boolean)
    date_of_collection=Column(DateTime)
    post_source_type=Column(String)
    post_source_platform=Column(String)
    post_source_data=Column(String)
    post_source_url=Column(String)


    def __init__(self,id,wallpost):
        self.id_wallpost=wallpost.get('id')
        self.id=id
        self.id_from= wallpost.get('from_id')


        self.date=  datetime.utcfromtimestamp((wallpost.get('date'))).strftime('%Y-%m-%d %H:%M:%S')
        self.post_type= wallpost.get('post_type')
        self.text=wallpost.get('text')
        self.reply_owner_id=wallpost.get('reply_owner_id')
        self.reply_post_id=wallpost.get('reply_post_id')
        if wallpost.get('friends_only')==1:
            self.friends_only=True
        else:
            self.friends_only=False
        if (wallpost.get('comments') is not None):
            self.comments_count=wallpost.get('comments').get('count')
        if (wallpost.get('copyright') is not None):
            self.copyright=wallpost.get('copyright').get('link')
        if (wallpost.get('likes') is not None):
            self.likes_count=wallpost.get('likes').get('count')
            if (wallpost.get('likes').get('user_likes')==0):
                self.likes_user_likes=False
            else:
                self.like_user_likes=True
        if (wallpost.get('reposts') is not None):
            self.reposts_count=wallpost.get('reposts').get('count')
        if (wallpost.get('views') is not None):
            self.views=wallpost.get('views').get('count')
        self.post_type=wallpost.get('post_type')
        if ( wallpost.get('geo')):
            self.geo_type= wallpost.get('geo').get('type')
            self.geo_coordinates= wallpost.get('geo').get('coordinates')
            self.id_place=wallpost.get('geo').get('place').get('id')
        if wallpost.get('is_pinned')==None:
            self.is_pinned=False
        else:
            self.is_pinned=True
        self.date_of_collection= datetime.now()
        if wallpost.get('post_source') is not None:
            self.post_source_type=wallpost.get('post_source').get('type')
            self.post_source_data=wallpost.get('post_source').get('data')
            self.post_source_platform=wallpost.get('post_source').get('platform')
            self.post_source_url=wallpost.get('post_source').get('url')