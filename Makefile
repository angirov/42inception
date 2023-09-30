all:
	cd srcs/cert && ./create_cert.sh
	cd srcs && docker compose up -d --build

prepare:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q) 2>/dev/null

clean:
	cd srcs && docker compose down
	rm -rf ${HOME}/data/*
	cd srcs/cert && ./clean_cert.sh