docker-test:
	docker build --tag cookiecutter-api-test --target final -f Dockerfile .
	docker run --rm -it cookiecutter-api-test

install:
	poetry install --no-root

lock:
	poetry lock --no-update

test:
	poetry run pytest --keep-baked-projects --basetemp=bakedprojects tests/
	@echo "Baked projects are in $(shell pwd)/bakedprojects"