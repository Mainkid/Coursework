from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base



class User_connections(Base):
    __tablename__ = 'user_connections'
    id = Column(Integer, primary_key=True, nullable=False)
    id_connection=Column(Integer, primary_key=True, nullable=False)
    login = Column(String)
    exports=Column(Boolean)

    def __init__(self, id, id_connection, login, exports):
        self.id= id
        self.id_connection= id_connection
        self.login= login
        self.exports= exports
