import socket

from .common import Common


class Local(Common):
    ALLOWED_HOSTS = ["*"]
    DEBUG = True
    LOG_LEVEL = "DEBUG"
    LOG_FORMATTER = "simple"
