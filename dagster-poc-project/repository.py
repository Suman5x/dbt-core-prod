from dagster import repository
from jobs import user_processing_job, post_processing_job

@repository
def my_repository():
    return [user_processing_job, post_processing_job]
