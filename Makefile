up: docker-up
down: docker-down
restart: docker-down docker-up
init: docker-down-clear docker-up

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

quiz:
	go run main.go quiz

parse:
	go run main.go parse

build:
	docker-compose exec app go build -o main main.go
