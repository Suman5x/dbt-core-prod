from dagster import job
from ops import fetch_users, process_users, fetch_posts, process_posts

@job
def user_processing_job():
    users = fetch_users()
    processed_users = process_users(users)

@job
def post_processing_job():
    posts = fetch_posts()
    processed_posts = process_posts(posts)
