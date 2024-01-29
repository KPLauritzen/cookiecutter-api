def test_package_importable():
    from {{cookiecutter.__package_name}}.placeholder import placeholder

    assert placeholder() == "placeholder"
