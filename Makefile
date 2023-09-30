all:
	cd srcs/cert && ./create_cert.sh
	cd srcs && docker compose up -d --build

clean:
	cd srcs && docker compose down
	rm -rf ${HOME}/data/*
	cd srcs/cert && ./clean_cert.sh