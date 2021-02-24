from sqlalchemy import Column, Integer
from web_app.web_DB.entities.Base import Base


class Telegram_id(Base):
    __tablename__ = 'telegram_users'
    user = Column(Integer, nullable=False,primary_key=True)


    def __init__(self, user):
        self.user=user