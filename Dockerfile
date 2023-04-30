FROM python:3.12.0a7-slim-bullseye
ENV DEF_VERSION 0.01
RUN apt-get update && apt-get install -y gcc libxml2-dev libxslt-dev libffi-dev libssl-dev
RUN pip install --upgrade pip
# RUN pip install scrapy
RUN pip install -r requirements.txt
WORKDIR /app
COPY . /app