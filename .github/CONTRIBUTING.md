# Contributing Guide

Thank you for considering contributing to this project! This guide outlines the basic workflow and expectations for contributing, especially during the early stages of the project.

## 📌 General Workflow for Code Contributions

To keep things organized and maintain a clear development history, please follow this basic flow:

1. **Open an Issue**
   - Check if a similar issue already exists.
   - If not, create a new issue and add it to the Projects (KANBAN) for visibility.

2. **Create a Development Branch**
   - Branch off from `main`.
   - Use the naming convention: `dev/0x-[chapter-name]`
     - Example: `dev/01-Density_Estimation`

3. **Develop and Commit**
   - Make your changes and commit them with meaningful messages.
   - Ensure your changes pass all pre-commit checks locally.

4. **Open a Pull Request (PR)**
   - Base your PR against the `main` branch.
   - Use the [PR Template](./PULL_REQUEST_TEMPLATE.md).
   - Mark it as a **Draft** if the implementation is not yet ready for review.
   - Make sure someone else reviews your PR before merging (at least one reviewer).

## ✅ Code Style & Checks

- This project uses [pre-commit](https://pre-commit.com/) hooks to enforce code quality.
- Please run `uv run pre-commit install` after cloning the repo.
- The CI checks for:
  - Linting with Ruff (no auto-fix in CI)
  - Static typing with mypy
  - Notebook checks via nbQA

## 📝 Notes

- Keep PRs focused. Avoid combining unrelated changes in one PR.
- Document any non-obvious decisions or code with comments or notes in the PR body.
- Avoid committing large files (>10MB). If necessary, use external storage and provide a download link.

We appreciate your help in making this project better. Happy coding! 🎉

