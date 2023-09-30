DOMAIN_NAME := vangirov.42.fr
PROJECT_NAME := inception
WP_CONTAINER := ${PROJECT_NAME}-wordpress-1

all: build up status

build:
	echo "127.0.0.1       ${DOMAIN_NAME}" | sudo tee -a /etc/hosts 
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress
	cd srcs/cert && ./create_cert.sh
	cd srcs && docker compose build

up:
	cd srcs && docker compose -p ${PROJECT_NAME} up -d

stop:
	cd srcs && docker compose -p ${PROJECT_NAME} stop -d

prepare:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2>/dev/null

down:
	cd srcs && docker compose -p ${PROJECT_NAME} down

status:
	docker image ls
	docker volume ls
	docker network ls
	docker ps -a

logwp:
	watch docker logs ${WP_CONTAINER}

clean: down prepare 
	sudo sed -i /${DOMAIN_NAME}/d /etc/hosts
	sudo rm -rf ${HOME}/data/*
	cd srcs/cert && ./clean_cert.sh

recreate: clean all

restart: down up

.PHONY: all build up prepare down status clean restart logwp