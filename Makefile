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

run:
	docker-compose exec app go run main.go

build:
	docker-compose exec app go build -o main main.go

quiz:
	docker-compose exec app ./main
