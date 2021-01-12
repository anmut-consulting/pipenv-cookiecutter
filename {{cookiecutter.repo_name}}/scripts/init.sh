#!/bin/sh
echo "-> initialise local git repo"
{
    git init

    if [ -f Pipfile.lock ]; then
        echo "-> Pipfile.lock present! Running pipenv sync --dev"
        pipenv sync --dev
    else
        echo "-> Pipfile.lock absent! Running pipenv install --dev"
        pipenv install --dev
    fi

    echo "-> set git to follow tags on push"
    git config push.followTags true

    echo "-> configure git hooks"
    pre-commit install -t pre-commit
    pre-commit install -t pre-push

    echo "-> adding files and running preliminary tests"
    git add .
    pipenv run tests

    echo "-> adding formatted files back and running tests again"
    git add .
    pipenv run tests

    echo "Creating ipython kernel for use with Jupyter"
    pipenv run create_ipykernel
} \
&& {
    echo "-> installed developer environment <-"
    echo "#################################################"
    echo "REPO FULLY INITIALISED! You're set up to develop."

    echo "If this is a brand new project, consider running the git-init script:"
    echo "'pipenv run git_setup' to set up the branches and tags"
    echo "#################################################"
}
