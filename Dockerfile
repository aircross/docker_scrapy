FROM python:3.12.0a7-slim-bullseye
RUN apt-get update && apt-get install -y gcc libxml2-dev libxslt-dev libffi-dev libssl-dev
RUN pip install --upgrade pip
RUN pip install -r scrapy $PKG
WORKDIR /app
COPY . /app