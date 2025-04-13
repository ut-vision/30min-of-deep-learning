# Makefile for dev tooling (lint, format, etc.)

.PHONY: help format lint check setup

help:
	@echo "Usage:"
	@echo "  make setup         Set up pre-commit hooks"
	@echo "  make fmt           Format .py and .ipynb files"
	@echo "  make lint          Run lint checks (ruff, mypy) on .py and .ipynb files"
	@echo "  make check         Run pre-commit on all files (CI check)"

setup:
	uv run pre-commit install

fmt:
	uv run ruff format .
	uv run nbqa "ruff format" .

lint:
	uv run ruff check . --fix
	uv run nbqa ruff . --fix
	uv run mypy . --ignore-missing-imports
	uv run nbqa mypy . --ignore-missing-imports

check:
	uv run pre-commit run --all-files --show-diff-on-failure
