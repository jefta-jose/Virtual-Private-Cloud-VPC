from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from database import SessionLocal, engine
import models, schemas

from sqlalchemy.dialects.postgresql import UUID
import uuid

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# Allow all origins (for dev only — lock down in production)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # Or set to ["http://localhost:3000"] for frontend only
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
        
# add a new movie
@app.post("/movies", response_model=schemas.Movie, status_code=201)
def create_movie(movie: schemas.MovieCreate, db: Session = Depends(get_db)):
    db_movie = models.Movie(**movie.model_dump())
    db.add(db_movie)
    db.commit()
    db.refresh(db_movie)
    return db_movie

# get all movies
@app.get("/movies", response_model=list[schemas.Movie])
def read_movies(db: Session = Depends(get_db)):
    return db.query(models.Movie).all()

# get movie by id
@app.get("/movies/{movie_id}", response_model=schemas.Movie)
def read_movie(movie_id: uuid.UUID, db: Session = Depends(get_db)):
    movie = db.query(models.Movie).filter(models.Movie.id == movie_id).first()
    if not movie:
        raise HTTPException(status_code=404, detail="Movie not found")
    return movie

# update movie by id
@app.put("/movies/{movie_id}", response_model=schemas.Movie)
def update_movie(movie_id: uuid.UUID, updated_movie: schemas.MovieCreate, db: Session = Depends(get_db)):
    movie = db.query(models.Movie).get(movie_id)
    if not movie:
        raise HTTPException(status_code=404, detail="Movie not found")
    for key, value in updated_movie.model_dump().items():
        setattr(movie, key, value)
    db.commit()
    db.refresh(movie)
    return movie

# delete movie by id
@app.delete("/movies/{movie_id}")
def delete_movie(movie_id: uuid.UUID, db: Session = Depends(get_db)):
    movie = db.query(models.Movie).get(movie_id)
    if not movie:
        raise HTTPException(status_code=404, detail="Movie not found")
    db.delete(movie)
    db.commit()
    return {"detail": "Movie deleted successfully"}