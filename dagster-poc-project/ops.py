from dagster import op
import requests

@op
def fetch_users():
    response = requests.get("https://randomuser.me/api/?results=5")
    return response.json()["results"]

@op
def process_users(users):
    return {"total_users": len(users)}

@op
def fetch_posts():
    response = requests.get("https://jsonplaceholder.typicode.com/posts")
    return response.json()

@op
def process_posts(posts):
    return {"total_posts": len(posts)}


