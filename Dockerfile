# syntax=docker/dockerfile:1
FROM python:3.11-slim-bookworm as base

FROM base as builder
ENV XDG_CACHE_HOME=/cache
# Create a sample project from the template

RUN --mount=type=cache,target=$XDG_CACHE_HOME \
    pip install cookiecutter==2.5.0

WORKDIR /cookiecutter-api
COPY cookiecutter.json .
COPY {{cookiecutter.__project_slug}} {{cookiecutter.__project_slug}}

WORKDIR /
RUN cookiecutter --no-input /cookiecutter-api

FROM base as final
# Run various tests on the sample project

ENV POETRY_VERSION=1.7.1 \
    POETRY_VIRTUALENVS_CREATE=false \
    XDG_CACHE_HOME=/cache

RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update && apt-get install -y \
    git \
    make 
RUN --mount=type=cache,target=$XDG_CACHE_HOME \
    pip install poetry==${POETRY_VERSION}

COPY --from=builder /base-project /base-project
WORKDIR /base-project

RUN --mount=type=cache,target=$XDG_CACHE_HOME \
    make install

RUN make test
# git init is needed for pre-commit hooks
RUN --mount=type=cache,target=$XDG_CACHE_HOME \
    git init && git add . && \ 
    make lint

CMD [ "echo", "Tests are done" ]