# Configurations
COMPOSE_FILE = docker-compose.yml

.PHONY: help up up-d down build restart logs clean test package

# Help command showing list of available tasks
help:
	@echo "========================================================================"
	@echo "                       Spring Boot Docker Makefile                      "
	@echo "========================================================================"
	@echo "Available commands:"
	@echo "  make up       - Start all containers in detached mode (background)"
	@echo "  make up-f     - Start all containers in the foreground"
	@echo "  make down     - Stop all containers and remove networks"
	@echo "  make build    - Build or rebuild container images"
	@echo "  make restart  - Restart all containers"
	@echo "  make logs     - Tail logs from all containers"
	@echo "  make clean    - Stop containers, delete volumes, and clean local build"
	@echo "  make test     - Run JUnit tests locally using the maven wrapper"
	@echo "  make package  - Create application package JAR locally"
	@echo "========================================================================"

up:
	docker compose -f $(COMPOSE_FILE) up -d

up-d:
	docker compose -f $(COMPOSE_FILE) up
	
stop:
	docker compose -f $(COMPOSE_FILE) stop

down:
	docker compose -f $(COMPOSE_FILE) down

build:
	docker compose -f $(COMPOSE_FILE) build

restart:
	docker compose -f $(COMPOSE_FILE) restart

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

clean:
	docker compose -f $(COMPOSE_FILE) down -v --rmi local
	./mvnw clean

test:
	./mvnw test

package:
	./mvnw package
