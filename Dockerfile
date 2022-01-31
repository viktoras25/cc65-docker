FROM alpine:latest

ENV BUILD_DIR="/tmp" \
    CC65_VERSION="V2.19"

RUN apk add --no-cache build-base && \
    echo "Building CC65 ${CC65_VERSION}" && \
    cd ${BUILD_DIR} && \
    wget https://github.com/cc65/cc65/archive/${CC65_VERSION}.tar.gz && \
    tar xzf ${CC65_VERSION}.tar.gz && \
    cd cc65* && \
    env PREFIX=/usr/local make && \
    env PREFIX=/usr/local make install && \
    echo "Cleaning up" && \
    cd ${BUILD_DIR} && \
    rm -rf * && \
    apk del --no-cache build-base && \
    apk add --no-cache make && \
    chmod +x /usr/local/bin/*
