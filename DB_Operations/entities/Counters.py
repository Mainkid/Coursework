from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Counters(Base):
    __tablename__='counters'
    id= Column(Integer, primary_key=True, nullable=False)
    albums= Column(Integer)
    videos= Column(Integer)
    audios=Column(Integer)
    photos=Column(Integer)
    notes=Column(Integer)
    friends=Column(Integer)
    groups=Column(Integer)
    online_friends=Column(Integer)
    mutual_friends=Column(Integer)
    user_videos=Column(Integer)
    followers=Column(Integer)
    pages=Column(Integer)

    def __init__(self, user):
        self.id=user.get('id')
        self.albums=user.get('counters').get('albums')
        self.videos=user.get('counters').get('videos')
        self.audios=user.get('counters').get('audios')
        self.photos=user.get('counters').get('photos')
        self.notes=user.get('counters').get('notes')
        self.friends=user.get('counters').get('friends')
        self.groups=user.get('counters').get('groups')
        self.online_friends=user.get('counters').get('online_friends')
        self.mutual_friends=user.get('counters').get('mutual_friends')
        self.user_videos=user.get('counters').get('user_videos')
        self.followers=user.get('counters').get('followers')
        self.pages=user.get('counters').get('pages')