# Pipenv Python Cookiecutter

Best practices [cookiecutter](https://github.com/audreyr/cookiecutter) template as described in this [blogpost](https://sourcery.ai/blog/python-best-practices/).

## Features
- Testing with [pytest](https://docs.pytest.org/en/latest/)
- Formatting with [black](https://github.com/psf/black)
- Import sorting with [isort](https://github.com/timothycrosley/isort)
- Static typing with [mypy](http://mypy-lang.org/)
- Linting with [flake8](http://flake8.pycqa.org/en/latest/)
- Git hooks that run all the above with [pre-commit](https://pre-commit.com/)
- Deployment ready with [Docker](https://docker.com/)
- Continuous Integration with [GitHub Actions](https://github.com/features/actions)

## Quickstart
If you have used this cookiecutter template before, you can go ahead and skip this section.

If this is your first time, please make sure you've covered [the basics](./the_basics.md) before you start.
That link takes you to a neat writeup about steps to take when setting up on a fresh machine.
There is even a handy script [basics](./basics.sh) you can run.

Install **pipx**
```
python3 -m pip install pipx
python3 -m pipx ensurepath
exit
```
> *now close your terminal window and open a new one before continuing*

Install **pipenv** using pipx
```
pipx install pipenv
```
Install **cookiecutter** using pipx
```
pipx install cookiecutter
```

## Using Cookiecutter
First, please ensure you have created an empty repository on the online GitHub platform.
> To avoid errors, **do not** initialize the new repository with README, license, or gitignore files. You can add these files after your project has been pushed to your remote of choice (GitHub, GitLab, etc...).

Then, from terminal, `cd` to where you want your project to be
> I use `~/dev/` for my development projects.

and run the following command
```
pipx run cookiecutter gh:anmut-consulting/pipenv-cookiecutter
```

If you want to specify a branch you can do that with:
```
pipx run cookiecutter gh:anmut-consulting/pipenv-cookiecutter --checkout <branch_name>
```

Both will prompt a series of questions about the new project you are setting up.

You will be asked for the `repo_name` of the GitHub project.
Make sure you enter the name verbatim.

Please leave the github username on the default (anmut-consulting) to avoid running into problems with adding the remote.
The `project_name` can be fully punctuated, i.e. "My Project", but please ensure you use an [import friendly](https://www.python.org/dev/peps/pep-0008/#id40) name for your `repo_name`.

When all the questions are answered, a folder is created in your current working directory (`pwd`).
Enter that newly generated project directory
```
cd <repo_name>
```

and simply run the following:
```
pipenv run init
```
[see here for details](./{{cookiecutter.repo_name}}/scripts/init.sh)


> You will see errors on this step. **Don't be alarmed!**, this is by design to preformat the repo.  **See the note under point 5 below**

Finally, remember to actually activate the environment when you want to interact with the code! From the same newly-created folder:
```
pipenv shell
```

## Linking your local project to the remote repository
If you've already created the repo on Gihub, you can run the command below to link your local repository to the Github remote:
```
pipenv run git_setup
```
Here's how to do it manually:

1.  Ensure a new repository exists on your online GitHub platform.
> To avoid errors, **do not** initialize the new repository with README, license, or gitignore files. You can add these files after your project has been pushed to your remote of choice (GitHub, GitLab, etc...).
2.  Open Terminal and change the current working directory to your local project.
3.  Initialize the local directory as a Git repository.
```
git init
```
4.  Add the files in your new local repository. This stages them for the first commit.
```
git add .
# Adds the files in the local repository and stages them for commit. 
# To unstage a file, use 'git reset HEAD YOUR-FILE'.
```
5.  Commit the files that you've staged in your local repository.
```
git commit -m "First commit"
# Commits the tracked changes and prepares them to be pushed to a remote repository. 
# To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.
```
> You will get an error if you are in master.  If you want to circumvent the test, use the `--no-verify` flag in the `git commit` and the `git push` commands.
6.  In Terminal, add the URL for the remote repository where your local repository will be pushed.
```
git remote add origin <remote repository URL>
# Sets the new remote
git remote -v
# Verifies the new remote URL
```
7.  Push the changes in your local repository to GitHub.
```
git push -u origin master
# Pushes the changes in your local repository up to the remote repository you specified as the origin
```

## Set branch protection on Github
This cookiecutter generates a repo designed to work with Github's branch protection.  To set that up, see [their documentation](https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/defining-the-mergeability-of-pull-requests).  You want to protect **master** or **main** at least and configure it to require the `check-versions` and `test` actions.
> Note that you will likely need to have created your first pull request fewer than 7 days ago for these tests to show up on Github.

## Update SharePoint links
The cookiecutter template README.rst comes with generic links to the Distributions and Documentation SharePoint folders that will need updating once you have followed all the instructions above.

If you already have the correct folder setup within your product folder then its just a matter of copy-pasting those links over the current ones.

If those folders don't exist, you will need to create them (with the blessing of the SharePoint owner) as described in the [Anmut Workstream folders README](https://anmut.sharepoint.com/:w:/g/EYBW8XH-_79OqGboZSckSDIBcwOgb84VRC1MaSz3nsy35Q?e=jTmHg1) before copy-pasting the folder links over the current ones.

Or, if you would rather keep those high level links, then please make sure you include instructions on how to navigate to the correct folders.

## Failed tests
Each time a test fails at the push stage, the packages will likely implement a set of improvements to your code which will then need to be manually re-added and committed. 
To do this, you simply need to go through the push process again:
1. Check what's been changed
```
git diff
# See what's changed

git status
# Check the overall status of unstaged commits
```
2. Repeat the add and commit process
```
git add .
# If you're happy, add all changes to the commit
# Alternatively, add specific files by git add <filename>

git commit -m "Your message"
# Commit

git push -u origin master OR git push (if you have successfully ran the first push command already)
# Push, as above
```

**You're all set! Happy coding!**
