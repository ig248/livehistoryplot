install:
	pipenv install

dev-install:
	pipenv install --dev

yapf:
	pipenv run yapf -vv -ir .
	pipenv run isort -y

lint:
	pipenv run flake8 .
	pipenv run pydocstyle .
	pipenv run mypy .

clean:
	find . | grep -E '(__pycache__|\.pyc|\.pyo$$)' | xargs rm -rf

test:
	pipenv run pytest --cov=.

test-cov:
	pipenv run pytest --cov=. --cov-report html --cov-report term

release:
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/*
