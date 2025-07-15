from sqlalchemy import Column, Integer, String
from database import Base
from sqlalchemy.dialects.postgresql import UUID
import uuid

class Movie(Base):
    __tablename__ = "movies"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4, unique=True, index=True)
    title = Column(String, index=True)
    description = Column(String, index=True)    
    year = Column(Integer, index=True)