import os
from .common import Common


class Local(Common):
    ALLOWED_HOSTS = ["*"]
    DEBUG = True
    LOG_LEVEL = "DEBUG"
    LOG_FORMATTER = "simple"

    SECRET_KEY: str = os.getenv("DJANGO_SECRET_KEY", "sddds")
