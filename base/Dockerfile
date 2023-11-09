FROM ubuntu:22.04

LABEL maintainer="longjin@dragonos.org"

WORKDIR /app

VOLUME [ "~/.rustup" ]
VOLUME [ "~/.cargo" ]
COPY ./cargo-config /app/

ENV RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
ENV RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
ENV PATH="/root/.cargo/bin:${PATH}"

RUN apt update && \
    apt install -y git wget curl bubblewrap


ADD binfiles/bin/* /usr/bin
