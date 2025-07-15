# Pydantic is a data validation and parsing library built on top of Python’s type hints. It allows you to define data models (schemas) using Python classes, and automatically:
# - Validates input data
# - Parses types correctly (e.g. string to int)
# - Throws detailed errors when data is invalid

from pydantic import BaseModel

class MovieBase(BaseModel):
    title: str
    description: str
    year: int
    
class MovieCreate(MovieBase):
    pass

class Movie(MovieBase):
    id: str
    
    class Config:
        orm_mode = True