from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from datetime import date
from datetime import datetime
from sqlalchemy.orm import relationship
from DB_Operations.entities.Base import Base
from time import time


class User(Base):
    __tablename__='user_data_table'
    id= Column(Integer,primary_key=True, nullable=False)
    first_name= Column(String, nullable=False)
    last_name=Column(String, nullable=False)
    deactivated= Column(Integer)
    is_closed = Column(Boolean)
    can_access_closed = Column(Boolean)
    about = Column(String)
    activities= Column(String)
    bdate = Column(Date)
    #blacklisted = Column(Boolean)
    #blacklisted_by_me = Column(Boolean)
    books = Column(String)
    can_post = Column(Boolean)
    can_see_all_posts = Column(Boolean)
    can_see_audio = Column(Boolean)
    can_send_friend_request = Column(Boolean)
    can_write_private_message = Column(Boolean)
    city_id = Column(Integer)
    mobile_phone = Column(String)
    home_phone = Column(String)
    country_id = Column(Integer)
    domain = Column(String)
    friend_status = Column(Integer)
    games = Column(String)
    has_mobile = Column(Boolean)
    has_photo = Column(Boolean)
    home_town = Column(String)
    interests = Column(String)
    is_favorite = Column(Boolean)
    is_friend = Column(Boolean)
    is_hidden_from_feed = Column(Boolean)
    last_seen_time = Column(DateTime)
    last_seen_platform =Column(Integer)
    maiden_name = Column(String)
    movies = Column(String)
    music = Column(String)
    nickname= Column(String)
    online= Column(Boolean)
    photo_50= Column(String)
    photo_100 = Column(String)
    photo_200_orig=Column(String)
    photo_200=Column(String)
    photo_400_orig=Column(String)
    photo_id=Column(Integer)
    photo_max=Column(String)
    photo_max_orig=Column(String)
    quotes=Column(String)
    screen_name=Column(String)
    sex=Column(Integer)
    site=Column(String)
    status=Column(String)
    timezone=Column(Integer)
    trending=Column(Boolean)
    verified=Column(Boolean)
    wall_default=Column(Boolean)
    political=Column(Integer)
    religion= Column(String)
    inspired_by=Column(String)
    people_main=Column(Integer)
    life_main=Column(Integer)
    smoking=Column(Integer)
    alcohol=Column(Integer)
    relation_type=Column(Integer)
    relation_partner_ID=Column(Integer)
    Date_of_Collection=Column(DateTime)



    def __init__(self, user):
        self.id=user.get('id')
        self.first_name = user.get('first_name')
        self.last_name = user.get('last_name')
        self.deactivated = user.get('deactivated')
        self.is_closed = user.get('is_closed')
        self.can_access_closed = user.get('can_access_closed')
        self.about = user.get('about')
        self.activities = user.get('activities')
        birtday=user.get('bdate')
        if (birtday is not None):
            if(len(birtday)<=5):
                birtday+='.1900'
        self.bdate = birtday
        self.books = user.get('books')
        self.can_post = bool(user.get('can_post'))
        self.can_see_all_posts = bool(user.get('can_see_all_posts'))
        self.can_see_audio = bool(user.get('can_see_audio'))
        self.can_send_friend_request = bool(user.get('can_send_friend_request'))
        self.can_write_private_message = bool(user.get('can_write_private_message'))
        city=user.get('city')
        if (city is not None):
            self.city_id = city.get('id')
        self.mobile_phone = user.get('mobile_phone')
        self.home_phone = user.get('home_phone')
        country=user.get('country')
        if (country is not None):
            self.country_id = country.get('id')
        self.domain = user.get('domain')
        self.friend_status = user.get('friend_status')
        self.games = user.get('games')
        self.has_mobile = bool(user.get('has_mobile'))
        self.has_photo = bool(user.get('has_photo'))
        self.home_town = user.get('home_town')
        self.interests = user.get('interests')
        self.is_favorite = bool(user.get('is_favorite'))
        self.is_friend = bool(user.get('is_friend'))
        self.is_hidden_from_feed = bool(user.get('is_hidden_from_feed'))
        #qwe=(user.get('last_seen').get('time'))
        #print(datetime.utcfromtimestamp(qwe).strftime('%Y-%m-%d %H:%M:%S'))
        #qwe=datetime((user.get('last_seen').get('time'))).strftime('%Y-%m-%d %H:%M:%S')

        #self.last_seen_time = datetime.utcfromtimestamp(datetime((user.get('last_seen').get('time'))).strftime('%Y-%m-%d %H:%M:%S'))
        last_seen=user.get('last_seen')
        if (last_seen is not None):
            self.last_seen_platform = last_seen.get('platform')
            self.last_seen_time = datetime.utcfromtimestamp((user.get('last_seen').get('time'))).strftime('%Y-%m-%d %H:%M:%S')
        self.maiden_name = user.get('maiden_name')
        self.movies = user.get('movies')
        self.music = user.get('music')
        self.nickname = user.get('nickname')
        self.online = bool(user.get('online'))
        self.photo_50 = user.get('photo_50')
        self.photo_100 = user.get('photo_100')
        self.photo_200_orig = user.get('photo_200_orig')
        self.photo_200 = user.get('photo_200')
        self.photo_400_orig = user.get('photo_400_orig')
        if (user.get('photo_id') is not None):
            self.photo_id = user.get('photo_id').split('_')[1]
        self.photo_max = user.get('photo_max')
        self.photo_max_orig = user.get('photo_max_orig')
        self.quotes = user.get('quotes')
        self.screen_name = user.get('screen_name')
        self.sex = user.get('sex')
        self.site = user.get('site')
        self.status = user.get('status')
        self.timezone = user.get('timezone')
        self.trending = user.get('trending')
        self.verified = bool(user.get('verified'))
        self.wall_default = bool(user.get('wall_default'))
        personal=user.get('personal')
        if (personal is not None and len(personal)>0):
            self.political = personal.get('political')
            self.religion = personal.get('religion')
            self.inspired_by = personal.get('alcohol')
            self.people_main = personal.get('people_main')
            self.life_main = personal.get('life_main')
            self.smoking = personal.get('smoking')
            self.alcohol = personal.get('alcohol')
        self.relation_type = user.get('relation')
        self.relation_partner_ID = user.get('relation_partner')
        self.Date_of_Collection = datetime.now()
        print()

    #Доделать время!







