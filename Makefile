all:
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress
	cd srcs/cert && ./create_cert.sh
	cd srcs && docker compose up -d --build

prepare:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2>/dev/null

down:
	cd srcs && docker compose down

clean: prepare 
	rm -rf ${HOME}/data/*
	cd srcs/cert && ./clean_cert.sh