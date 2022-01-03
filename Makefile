.DEFAULT_GOAL := help

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: up
up: ## run the project
	@docker-compose run --service-ports --rm app || true

.PHONY: stop
stop: ## stop Docker containers without removing them
	@docker-compose stop

.PHONY: down
down: ## stop and remove Docker containers
	@docker-compose down --remove-orphans

.PHONY: rebuild
rebuild: ## rebuild base Docker images
	@docker-compose down --remove-orphans
	@docker-compose build --no-cache

.PHONY: reset
reset: ## update Docker images and reset local databases
	@docker-compose down --volumes --remove-orphans
	@docker-compose pull

.PHONY: pull
pull: ## update Docker images without losing local databases
	@docker-compose down --remove-orphans
	@docker-compose pull

.PHONY: bash
bash: ## drops you into a running container shell
	@docker exec -it -e RUNTYPE=bash $$(docker ps|grep awsite_app|awk '{ print $$1 }') django-admin shell || true

.PHONY: rootbash
rootbash: ## drops you into a running container shell as root
	@docker exec -it -e RUNTYPE=bash --user=root $$(docker ps|grep awsite_app|awk '{ print $$1 }') django-admin shell || true

.PHONY: user
user: ## create a super user only run this command in local
	@docker exec -it -e RUNTYPE=bash $$(docker ps|grep awsite_app|awk '{ print $$1 }') python manage.py createsu || true

.PHONY: test
test: ## run project test
	@docker exec -it -e RUNTYPE=bash $$(docker ps|grep awsite_app|awk '{ print $$1 }') python manage.py test || true

.PHONY: loaddata
loaddata: ## load sample data in the local environment
	@docker exec -it -e RUNTYPE=bash $$(docker ps|grep awsite_app|awk '{ print $$1 }') python manage.py loaddata pos/fixtures/sample_data.json || true

.PHONY: checkcode
checkcode: ## check the code with pre-commit
	@docker exec -it -e RUNTYPE=bash $$(docker ps|grep awsite_app|awk '{ print $$1 }') pre-commit run --all-files || true
