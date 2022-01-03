import os

from configurations.wsgi import get_wsgi_application

django_configuration = os.getenv("APP_FLAVOR", "Local").capitalize()
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "awsite.settings")
os.environ.setdefault("DJANGO_CONFIGURATION", django_configuration)

application = get_wsgi_application()
