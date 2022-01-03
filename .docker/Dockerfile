FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

ARG APP_FLAVOR=Local
ENV APP_FLAVOR=$APP_FLAVOR

COPY ./requirements /app/requirements/

RUN pip install --upgrade pip && pip install pipenv
RUN apt-get update && apt-get install -y --no-install-recommends gcc python-dev libpq-dev git

# Install individual dependencies
# so that we could avoid install extra packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends netcat curl procps vim libpq5 adduser postgresql postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --only-binary=uvloop -r /app/requirements/requirements.txt \
    && pip install --no-cache-dir -r /app/requirements/requirements-test.txt

WORKDIR /app

# port tcp 8000 published
EXPOSE 8000

# [Security] Limit the scope of user who run the docker image
RUN useradd -ms /bin/bash user

USER user
