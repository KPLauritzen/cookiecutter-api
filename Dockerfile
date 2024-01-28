FROM python:3.12-slim-bookworm as builder
# Create a sample project from the template

RUN pip install cookiecutter

WORKDIR /cookiecutter-api
COPY cookiecutter.json .
COPY {{cookiecutter.__project_slug}} {{cookiecutter.__project_slug}}

WORKDIR /
RUN cookiecutter --no-input /cookiecutter-api

FROM python:3.12-slim-bookworm as final
ENV POETRY_VERSION=1.7.1 \
    POETRY_VIRTUALENVS_CREATE=false

RUN pip install poetry==${POETRY_VERSION}

# Run various tests on the sample project
COPY --from=builder /base-project /base-project
WORKDIR /base-project

RUN poetry install --no-interaction --no-ansi

CMD [ "echo", "Tests are done" ]