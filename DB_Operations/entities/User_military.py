from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class User_military(Base):
    __tablename__ = 'military'
    id = Column(Integer, primary_key=True, nullable=False)
    id_num_military = Column(Integer, primary_key=True, nullable=False)
    unit_id=Column(Integer)
    country_id=Column(Integer)
    fromc=Column(Integer)
    until=Column(Integer)



    def __init__(self,user_id,military_num,military):
        self.id=user_id
        self.id_num_military=military_num
        self.unit_id=military.get('unit_id')
        self.country_id=military.get('country_id')
        self.fromc=military.get('from')
        self.until=military.get('until')
