import pytest
from pytest_cookies.plugin import Result, Cookies
from pathlib import Path


@pytest.fixture
def baked_project(cookies: Cookies) -> Result:
    result = cookies.bake(extra_context={"project_name": "Hello World"})
    return result


def test_project_bakes_withouterror(baked_project: Result) -> None:
    assert baked_project.exit_code == 0
    assert baked_project.exception is None


def test_project_path(baked_project: Result) -> None:
    assert isinstance(baked_project.project_path, Path)
    assert baked_project.project_path.name == "hello-world"
    assert baked_project.project_path.is_dir()
