# Makefile for dev tooling (lint, format, etc.)

.PHONY: help format lint check setup

help:
	@echo "Usage:"
	@echo "  make setup         Set up pre-commit hooks"
	@echo "  make fmt           Format .py and .ipynb files"
	@echo "  make lint          Run lint checks (ruff, mypy) on .py and .ipynb files"
	@echo "  make check         Run pre-commit on all files (CI check)"

setup:
	pre-commit install

fmt:
	ruff format .
	nbqa "ruff format" .

lint:
	ruff check . --fix
	nbqa ruff . --fix
	mypy . --ignore-missing-imports
	nbqa mypy . --ignore-missing-imports

check:
	pre-commit run --all-files --show-diff-on-failure
