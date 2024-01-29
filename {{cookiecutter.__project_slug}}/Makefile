install:
	poetry install --with dev

lock:
	poetry lock --no-update

test:
	poetry run pytest tests/

lint:
	pre-commit run --all-files