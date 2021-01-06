#!/bin/bash
CURRENT_BRANCH=`git branch --show-current`

if ! [[ $(git status | grep "working tree clean") ]]; then
    echo Please ensure git working tree is clean before attempting this!
    exit 1;
fi

if [ ! -f cookiecutter.yaml ]; then
  echo cookiecutter.yaml was not found!
  echo Please create and populate it with correct values.
  echo See https://github.com/anmut-consulting/pipenv-cookiecutter.git for the template
  exit 1;
fi

REPO_NAME=`grep repo_name: cookiecutter.yaml|cut -d : -f2|cut -d ' ' -f2`

git branch -D cookiecutter-update || echo
git checkout -b cookiecutter-update || exit 1
pipx run cookiecutter gh:anmut-consulting/pipenv-cookiecutter --config-file cookiecutter.yaml --output-dir .. -f --no-input
rm -rf tests
git checkout $CURRENT_BRANCH tests || echo "tests not affected"
rm -rf $REPO_NAME
git checkout $CURRENT_BRANCH $REPO_NAME || echo " $REPO_NAME not affected"
git add . && git commit -m "Cookiecutter updates" --no-verify
git checkout $CURRENT_BRANCH
git diff ${CURRENT_BRANCH}..cookiecutter-update
echo '*******************************************************'
echo '-> You can use "git diff ${CURRENT_BRANCH}..cookiecutter-update" to see the changes.'
echo '-> Interactively pull in the changes (either in git or in PyCharm or your IDE) you want.'
echo '-> In git, use "git checkout cookiecutter-update [filename]" to pull in a file/folder from the template.'
