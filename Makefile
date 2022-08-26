export TENSORBOARD_PORT := 7777
export JUPYTER_PORT 	:= 8888
export USER_ID          := $(shell id -u)
export USER_GROUP       := $(shell id -g)
export USER_NAME        := $(shell id -un)
export PWD              := $(shell pwd)
export PROJ_NAME        := merlin-test
export COMPOSE_CMD      := docker-compose -f docker/docker-compose.yaml -p ${PROJ_NAME}

.DEFAULT_GOAL := docker-build

docker-build:
	$(COMPOSE_CMD) build
up:
	$(COMPOSE_CMD) up --detach
down:
	$(COMPOSE_CMD) down
connect: up
	$(COMPOSE_CMD) exec jupyter tmux new-session -As main