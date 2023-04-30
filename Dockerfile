FROM python:3.12.0a7-bullseye
ENV DEF_VERSION 0.01
SHELL ["/bin/bash", "-c"]
RUN set -xe
RUN apt-get update
RUN apt-get install -y autoconf \
                          build-essential \
                          curl \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          libxml2 \
                          libxml2-dev \
                          libxslt1.1 \
                          libxslt1-dev \
                          libffi-dev \
                          libssl-dev \
                          python3-cryptography \
                          python3-dev \
                          python3-distutils \
                          python3-pil \
                          tini \
                          vim-tiny \
                          curl \
                          jq
RUN SCRAPY_LATEST_VER=$(curl -s https://api.github.com/repos/scrapy/scrapy/releases/latest | grep tag_name | cut -d '"' -f 4)
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
RUN pip install --no-cache-dir botocore ipython \
                   https://github.com/scrapy/scrapy/archive/refs/tags/$SCRAPY_LATEST_VER.zip
RUN apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      curl \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      python3-dev
RUN rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
WORKDIR /app
COPY . /app