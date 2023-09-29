all:
	cd cert && ./create_cert.sh
	docker compose up -d --build

clean:
	docker compose down
	sudo rm -rf data
	sudo rm -rf db_data
	cd cert && ./clean_cert.sh