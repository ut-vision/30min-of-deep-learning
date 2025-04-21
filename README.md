# 30 Minutes of Deep Learning

_**Lightweight hands-on Python notebooks supplementing the deep learning theories.**_

## What is this?

This repository contains an opinionated suite of hands-on Python notebooks for machine learning and deep learning tasks.

Those notebooks are designed to be used as a supplementary material, providing short-timed practices for learners that completes the learning of the theoretical concepts of models, and would like to have a lightweight hands-on.

We target **30 minutes** for moderate Python users to read through and finish the hands-on, hence the repository name.

The flow of the modules follow the structure of C. M. Bishop and H. Bishop, _Deep Learning: Foundations and Concepts_. Springer Nature, 2023.

> [!IMPORTANT]
> **Those are not an official supplementary material of the book, neither are they endorsed by the authors.**

## Why?

While mathematical theories provide the foundation for ML/DL, hands-on implementation helps learners:

- Solidify their understanding of abstract concepts (like the impact of hyperparameters)
- Develop practical skills for research and industry applications
- Gain intuition about models' behavior

We hence extract the key concepts and provide corresponding practical exercises for each topic.

## How to use?

As mentioned, we expect the reader to first learn corresponding theoretical concept
(whether from the book or other materials)
and then look into the exercises for code implementations.

## Environment Setup

We use **`uv`** for managing the environment and packages.

1. **Create the environment**

   ```bash
   uv sync
   ```

2. **Select the kernel**
   In Jupyter Notebook, select the kernel named `.venv (Python 3.13.2)`.

## Makefile
For **developers**, we provide a `Makefile` for common tasks:
- `make setup` to register the pre-commit hooks (please run this after cloning the repo)
- `make fmt` to format the code
- `make lint` to run the linter
- `make check` to run pre-commit checks virtually

## Tech stack

While still tentative, we will expect to provide hands-on using Python ecosystem:

- Package management: conda / uv
- Machine learning: Scikit-learn
- Deep learning: PyTorch
- Data processing: Numpy, Pandas
- Data visualization: Matplotlib, Seaborn

## Contributing

This is a new tutorial suite and we welcome contributions.
Feel free to submit an issue for problems or PR for fix.
