import os
from .common import Common


class Prod(Common):
    ALLOWED_HOSTS = ["*"]
    DEBUG = False
    LOG_LEVEL = "DEBUG"
    LOG_FORMATTER = "simple"

    SECRET_KEY: str = os.getenv("DJANGO_SECRET_KEY")

    # Database

    DATABASES: dict = {
        "default": {
            "ENGINE": "django.db.backends.postgresql_psycopg2",
            "NAME": os.getenv("RDS_DB_NAME"),
            "USER": os.getenv("RDS_USERNAME"),
            "PASSWORD": os.getenv("RDS_PASSWORD"),
            "HOST": os.getenv("RDS_HOSTNAME"),
            "PORT": os.getenv("RDS_PORT"),
        }
    }
