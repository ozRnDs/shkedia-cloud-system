import config

from fastapi import FastAPI
import uvicorn

app = FastAPI(description="Test RestAPI")

@app.get("/{somepath:path}")
def any_route(somepath: str):
    return f"This is working: {somepath}"

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=5000, log_level="info", access_log=False)

