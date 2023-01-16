# docker-rails-template

for create new repository from this template.

## Versions(.env file)

- Docker Compose 3.9
- ruby 3.2
- Ruby on Rails 7.0
- MySQL 8.0

## Bootstrap

1. edit versions

```env
.env

COMPOSE_RUBY_VERSION=3.2.0
COMPOSE_ALPINE_VERSION=3.17 # 余計なイメージのダウンロードを避けるため、ALPINEのバージョンをそろえて高速化する
COMPOSE_MYSQL_VERSION=8.0.31
```

```gemfile
Gemfile

ruby '3.2.0'
gem 'rails', '~> 7.0.4'
```

2. execute command below and create rails project

```shell
# create rails project
docker-compose run --rm --no-deps app bundle exec rails new . -d mysql
```

if you clone existing rails project by cloning repository

```shell
# create credentials
docker-compose run --rm --no-deps -e EDITOR="vi" app bundle exec rails bin/rails credentials:edit
```

## Boot server

```shell
docker-compose up -d
```
