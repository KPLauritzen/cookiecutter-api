# Cookiecutter API

Simple cookiecutter template for creating a Python API.
Created to figure out how to test cookiecutter templates.

## Usage

Download this repo, eg to `~/cookiecutter-api`, then run:

```shell
cookiecutter ~/cookiecutter-api
```

## Development of the template

### Install requirements

```shell
poetry install --no-root
```

### Testing

This is the reason for this repo. There are a few ways to test the template:

#### Pytest

```shell
make test
```

will run `pytest`, which will create a temporary directory, run the template and make some simple assertions about the files created

#### Docker

```shell
make docker-test
```

will create a sample project from this template as part of a docker build.
This allows us to create a python environment from the template specifdication and run the tests in the same environment.

#### CI/CD

Part of the template is a PR pipeline that is to be run any Pull Requests. These templates are particularly hard to test, so this will be an example of how to do it.

This is however not implemented yet.
