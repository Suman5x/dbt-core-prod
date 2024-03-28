from dagster import asset
from ops import fetch_users, process_users, fetch_posts, process_posts

@asset
def user_asset():
    return process_users(fetch_users())

@asset
def post_asset():
    return process_posts(fetch_posts())
