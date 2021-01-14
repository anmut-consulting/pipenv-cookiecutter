.. highlight:: shell

.. _contributing:

============
Contributing
============

Contributions are welcome, and they are greatly appreciated!
Every little bit helps, and credit will always be given.

See `Software Development Standards`_ for information on coding, testing and documentation standards.

You can contribute in many ways:

.. _Software Development Standards: https://anmutproductdev.atlassian.net/l/c/PEf0xApd

Types of Contributions
----------------------

Report Bugs
~~~~~~~~~~~

Report bugs at https://github.com/anmut-consulting/{{ cookiecutter.repo_name }}/issues.

If you are reporting a bug, please include:

* Your operating system name and version.
* Any details about your local setup that might be helpful in troubleshooting.
* Detailed steps to reproduce the bug.

Fix Bugs
~~~~~~~~

Look through the GitHub issues for bugs. Anything tagged with "bug" and "help
wanted" is open to whoever wants to implement it.

Implement Features
~~~~~~~~~~~~~~~~~~

Look through the GitHub issues for features. Anything tagged with "enhancement"
and "help wanted" is open to whoever wants to implement it.

Write Documentation
~~~~~~~~~~~~~~~~~~~

{{ cookiecutter.project_name }} could always use more documentation, whether as part of the
official {{ cookiecutter.project_name }} docs or in docstrings.

Submit Feedback
~~~~~~~~~~~~~~~

The best way to send feedback is to file an issue at https://github.com/anmut-consulting/{{ cookiecutter.repo_name }}/issues.

If you are proposing a feature:

* Explain in detail how it would work.
* Keep the scope as narrow as possible, to make it easier to implement.

Get Started!
------------

Ready to contribute? Here's how to set up `{{ cookiecutter.repo_name }}` for local development.

1. Clone the `{{ cookiecutter.repo_name }}` repo on GitHub.::

    $ git clone git@github.com:anmut-consulting/{{ cookiecutter.repo_name }}.git

2. Create a pipenv environment (assuming you have the `basics <https://github.com/anmut-consulting/pipenv-cookiecutter/blob/master/the_basics.md>`_ covered) ::

    $ cd {{ cookiecutter.repo_name }}
    $ pipenv run init

3. Activate your environment shell. ::

    $ pipenv shell

4. Create a branch for local development::

    $ git checkout -b PLAT-XX_ticket_name_here

  Now you can make your changes locally.

5. When you're done making changes, check that your changes pass all the tests by running::

    # to run the pre-commit hooks only, run:
    $ pipenv run tests
    # or
    $ pipenv run commit_test

    # to run coverage test only, run:
    $ pipenv run coverage

    # to run the pytest tests, run:
    $ pipenv run pytest

    # to run the pre-commit PUSH hooks, run:
    $ pipenv run push_test

    # to make the documentation, run:
    $ pipenv run make_docs

6. Commit your changes and push your branch to GitHub::

    $ git add .
    $ git commit -m "Your detailed description of your changes."
    $ git push origin PLAT-XX_ticket_name_here

7. Submit a pull request through the GitHub website.

8. Use the New Version tool on Github to bump the version - this will be a requirement on a repo that is set up correctly.  See **Branch Protection** in the [Cookiecutter README](https://github.com/anmut-consulting/pipenv-cookiecutter/blob/master/README.md) for more details.

    1.  Click on **[Actions]**
    2.  Select **New Version** on the left
    3.  Click on the **[Run Workflow]** button
    4.  Select the PR branch
    5.  Enter the version bump type:

        - **patch**: small fixes and performance improvements
        - **minor**: additional functionality introduced with no breaking changes (backwards compatible)
        - **major**: changes to existing functions that will cause old code to behave differently/break things.  *A good way to identify this is if existing tests failed and you had to modify the tests.*

    6.  You will see a new commit on that PR/branch that bumps the version shortly after clicking **[Run workflow]**
    7.  That will cause the **PR version bumped** test to pass, if everything went well.


Pull Request Guidelines
-----------------------

When creating a pull request:

* use `feat: PLAT-XX Ticket Title` if you are working on a feature ticket, or `fix: PLAT-XX Ticket Title` if you are working on a bug fix,
* provide a link to the JIRA ticket in the comment area as well as any additional context,
* apply the work in progress or do not merge labels if the PR is not quite ready to be reviewed or should not be merged yet, respectively,
* copy the link into the dev slack channel once the pull request is ready for review so that people know to review it.

Before you submit a pull request, check that it meets these guidelines:

1. The pull request should include tests.
2. If the pull request adds functionality, the docs should be updated. Put
   your new functionality into a function with a docstring, and add the
   feature to the list in README.rst.
3. The pull request should work for Python 3.6+

For more information on GitHub standards, see the `Software Development Standards`_ wiki.

Tips
----

You can check the command next to each of the **entry:** lines in :file:`.pre-commit-config.yaml` to understand what each of the individual pre-commit hooks runs.

Check the [scripts] section in :file:`Pipfile` to see the shortcuts you can run with ``$ pipenv run ..``, i.e. ``$ pipenv run coverage``.

Creating Releases
---------

New releases are automatically created for anything that is merged into master.  A versioned tag corresponding to the code version is created on Github and the **latest** tag is updated to, well, the latest version.
**This happens automatically and requires no action on your part.**  (If you'd like to understand how, check :file:`.github/workflows/tags_on_merge.yml` for the responsible file/configuration.

> Remember to amend your :file:`HISTORY.rst` to reflect the changes your PR introduces, especially if they are significant.
