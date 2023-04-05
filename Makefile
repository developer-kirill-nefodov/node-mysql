#!/usr/bin/make

include .env

docker_compose_bin= $(shell command -v docker-compose 2> /dev/null)
COMPOSE_CONFIG=--env-file .env -p $(PROJECT_NAME) -f docker/docker-compose.yml

build-img:
	$(docker_compose_bin) $(COMPOSE_CONFIG) build
up:
	$(docker_compose_bin) $(COMPOSE_CONFIG) up --no-recreate -d
up-runtime:
	$(docker_compose_bin) $(COMPOSE_CONFIG) up --build
down:
	$(docker_compose_bin) $(COMPOSE_CONFIG) down || true
restart:
	$(docker_compose_bin) $(COMPOSE_CONFIG) restart
