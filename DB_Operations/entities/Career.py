from sqlalchemy import Column, Integer, String, DateTime, Boolean, Date, DATETIME, ForeignKey
from DB_Operations.entities.Base import Base


class Career(Base):
    __tablename__ = 'career'
    id = Column(Integer, primary_key=True, nullable=False)
    id_career=Column(Integer, primary_key=True, nullable=False)
    group_id=Column(Integer)
    company=Column(String)
    country_id=Column(Integer)
    city_id=Column(Integer)
    fromc=Column(Integer)
    until=Column(Integer)
    position=Column(String)

    def __init__(self, id,id_career, career):
        self.id=id
        self.id_career=id_career
        self.group_id=career.get('group_id')
        self.company=career.get('company')
        self.country_id=career.get('country_id')
        self.city_id=career.get('city_id')
        self.fromc=career.get('from')
        self.until=career.get('until')
        self.position=career.get('position')