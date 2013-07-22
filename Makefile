clean:
	@find . -name "*.pyc" -delete

run:
	@python manage.py runserver 0.0.0.0:8000

deps:
	@pip install -r requirements.txt

settings:
	cp mariochaves/local_settings.example.py mariochaves/local_settings.py

add_remote:
	@heroku git:remote -a pistalo

syncdb:
	@python manage.py syncdb --noinput
	@python manage.py migrate

setup: deps settings add_remote syncdb

heroku:
	@git push heroku master

remote_migrate:
	@heroku run python manage.py syncdb --noinput
	@heroku run python manage.py migrate

collectstatic:
	@heroku run python manage.py collectstatic --noinput

deploy: heroku remote_migrate collectstatic