from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

api_app = FastAPI()

@api_app.get("/")
async def get_rows():
    return "Hello API"

app = FastAPI()
app.mount("/api", api_app)
app.mount("/", StaticFiles(directory="./dist", html=True), name="static")