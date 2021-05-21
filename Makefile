.PHONY: init ci analyze remove_vol dev up down migrate superuser

init:
	curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
	poetry install
analyze:
	pipenv run flake8 .
	pipenv run isort -v
remove_vol:
	docker volume rm project_management_backend_postgres_data
dev:
	docker-compose -f docker-compose-dev.yml build
up:
	docker-compose -f docker-compose-dev.yml up
down:
	docker-compose -f docker-compose-dev.yml down
migrate:
	docker-compose -f docker-compose-dev.yml run --rm web python manage.py migrate
superuser:
	docker-compose -f docker-compose-dev.yml run --rm web python manage.py createsuperuser

