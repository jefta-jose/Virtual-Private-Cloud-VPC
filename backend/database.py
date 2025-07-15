from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from urllib.parse import quote_plus

password = quote_plus("@dm1n/2025")

# local site for development, will later switch to AWS RDS
# connection string format: postgresql://<username>:<password>@<host>:<port>/<database>
SQLALCHEMY_DATABASE_URL = f"postgresql://adminuser:{password}@localhost:5432/MyDB"

engine = create_engine(SQLALCHEMY_DATABASE_URL)

# sessionmaker creates a factory for database sessions its like DbContext in .NET
SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False)

# this creates a base class for our models to inherit from
Base = declarative_base()