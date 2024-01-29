from pathlib import Path


def get_project_root() -> Path:
    this_file = Path(".")
    root = this_file.parent.parent
    return root
