from fastapi import FastAPI

from app.models import models
from app.db import engine
from app.routers import admin, todos, auth

# application
app = FastAPI()

# sets up database defined in engine
models.Base.metadata.create_all(bind=engine)

# Set API endpoints on router
app.include_router(auth.router)
app.include_router(todos.router)
app.include_router(admin.router)
