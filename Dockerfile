FROM debian:bullseye
ENV DEF_VERSION 0.01
SHELL ["/bin/bash", "-c"]
RUN set -xe \
    && echo ${TARGETPLATFORM} \
    && apt-get update \
    && apt-get install -y autoconf \
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
                          python3 \
                          python3-cryptography \
                          python3-dev \
                          python3-distutils \
                          python3-pil \
                          tini \
                          vim-tiny \
                          curl \
                          jq \
    && if [[ ${TARGETPLATFORM} = "linux/arm/v7" ]]; then apt install -y cargo; fi \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    SCRAPY_LATEST_VER=$(curl -s https://api.github.com/repos/scrapy/scrapy/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    && pip install --no-cache-dir botocore ipython \
                   https://github.com/scrapy/scrapy/archive/refs/tags/$SCRAPY_LATEST_VER.zip \
    && if [[ ${TARGETPLATFORM} = "linux/arm/v7" ]]; then apt purge -y --auto-remove cargo; fi \
    && apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      curl \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install scrapy
RUN pip install -r requirements.txt
WORKDIR /app
COPY . /app