.PHONY: init ci analyze remove_vol build up down migrate migrations superuser install collectstatic req shell

projectName = pbr_site
dockerComposeFile = docker-compose-dev.yml

init:
	curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
	poetry install
analyze:
	pipenv run flake8 .
	pipenv run isort -v
remove_vol:
	docker volume rm $(projectName)_postgres_data
build:
	docker-compose -f $(dockerComposeFile) build
up:
	docker-compose -f $(dockerComposeFile) up
down:
	docker-compose -f $(dockerComposeFile) down
migrations:
	docker-compose -f $(dockerComposeFile) run --rm web python manage.py makemigrations $(app)
migrate:
	docker-compose -f $(dockerComposeFile) run --rm web python manage.py migrate
superuser:
	docker-compose -f $(dockerComposeFile) run --rm web python manage.py createsuperuser
install:
	docker-compose -f $(dockerComposeFile) run --rm web pipenv install $(package) --dev
collectstatic:
	docker-compose -f $(dockerComposeFile) run --rm web python manage.py collectstatic --no-input
req:
	pipenv lock -r --keep-outdated --requirements > requirements.txt
shell:
	docker-compose -f $(dockerComposeFile) run --rm web python manage.py shell_plus