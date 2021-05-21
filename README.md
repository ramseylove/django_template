## Template for starting Django projects with custom user and profile. 

Builds in local venv with pipenv and sqlite, or with postgres in docker containers with docker-compose.

### Need to Run MakeMigrations on Accounts before Migrating

Using pipenv with dependencies:
* django = "==3.2.3"
* psycopg2-binary = "*"
* django-storages = "==1.11.1"
* boto3 = "==1.17.43"
* pillow = "==8.2.0"