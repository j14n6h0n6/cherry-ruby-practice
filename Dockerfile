FROM ruby:3.4-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    git \
    libpq-dev \
    shared-mime-info \
    locales \
    && rm -rf /var/lib/apt/lists/*

# 日本語ロケールの設定
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG=ja_JP.UTF-8

WORKDIR /app

COPY . /app