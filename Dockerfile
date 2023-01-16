# FROMの前のARGはレイヤー化しないが、ビルドステージで使えない（FROMにのみ有効）
ARG ALPINE_VERSION
ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-alpine$ALPINE_VERSION

# ENVはコンテナ内で環境変数として使いたい定数を指定する。ビルドのみ必要な定数はARGで十分
# key=valueの形にすることで一度に複数定義可能。レイヤーも一つで済む
ENV APP_ROOT=/app \
    LANG=ja-JP.UTF-8 \
    TZ=Asia/Tokyo

# RUN mkdir は WORKDIR で省略できる
WORKDIR $APP_ROOT

# 結果が変わらなそうなものから先に実行する
# gem インストール
RUN echo 'install: --no-document' > ~/.gemrc && \
    echo 'update: --no-document' >> ~/.gemrc && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        build-base \
        mysql-dev \
        tzdata \
        git && \
    rm -rf /usr/lib/libmysqld* && \
    rm -rf /usr/bin/mysql* && \
    # entrypointでパッケージをインストールする。
    # ビルド中はボリュームがマウントされていないため、毎回フルインストールになるので避ける
    echo $'#!/bin/sh \n\
echo "installing gems..."\n\
bundle config set --local path "vendor/bundle"\n\
bundle install -j4 --quiet\n\
echo "starting container entrypoint..."\n\
exec "$@" \n\
' > /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 3000
