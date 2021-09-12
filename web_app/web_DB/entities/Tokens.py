from sqlalchemy import Column, Integer,String
from web_app.web_DB.entities.Base import Base


class Tokens(Base):
    __tablename__ = 'tokens'
    token = Column(String, nullable=False,primary_key=True)

    def __init__(self, token):
        self.token=token