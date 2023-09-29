all:
	cd cert && ./create_cert.sh
	docker compose up -d --build

clean:
	docker compose down
	sudo rm -rf ${HOME}/data/*
	cd cert && ./clean_cert.sh