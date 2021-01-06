#!/bin/sh
{
    echo "-> initialise git repo"
    git init
} \
&& pipenv run tests || echo "Don't worry about the failed test about the master branch"
git add . \
&& git commit -m "initial commit" --no-verify \
&& {
	git remote add origin git@github.com:anmut-consulting/{{ cookiecutter.repo_name }}.git \
	|| echo "WARNING: problem with remote.  Please verify."} \
&& echo "Creating 'latest' tag" \
&& git tag -f latest \
&& git push -u origin master --no-verify --tags \
&& echo "  -> adding dev branch" \
&& git checkout -b dev \
&& git push -u origin dev \
&& {
    echo
    echo "#################################################"
    echo "GIT SETUP COMPLETE! You're set up to develop.  Please note you're now on the dev branch"
    echo "#################################################"
}
