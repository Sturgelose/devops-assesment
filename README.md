# DevOps Assessment Homework

This is TravelPerk's assessment homework for DevOps candidates. Please read
this document thoroughly and don't hesitate to contact us if you have any doubt.

## Prepare the assessment

To do this assessment follow these preliminary steps:

  * Fork this repo in your GitHub account
  * Set '[x] Require status checks to pass before merging' on master branch in Project Settings -> Branches
  * Review the code here and ask any questions: better clearing doubts and misunderstandings early on
  

## Run the app

1. Install Poetry in your computer
2. `poetry install` to install all the dependencies (including dev ones) in .venv/
3. `poetry shell` to start local .venv
4. `FLASK_APP=hello flask run`

### Why using poetry?

Using requirements.txt is dangerous. Also, using setup.py will always install the latest versions of flask available.
This makes a python env non reproducible. Poetry sets up a lockfile with all the versions set, so you can fully replicate
the actual environment.

### Linting process

* bandit to detect CVS security holes
* black to autolint
* flake8 to validate PEP8 structure

# Build process

It's done using a dual build system. This way we only use the files we need to run Flask and the API so there are no dev
libraries installed. This is done thanks to poetry separating dev and prod dependencies.

It could include in the future and extra layer build on top, so this way you can download a dev version that includes the tests,
and also run them in the container to make sure that the container works properly.

## Future ideas

Poetry makes it a bit harder to report using the actual github actions.
Also, reports done when doing the PR should be shown as artifacts or maybe even automatically lint the commit.