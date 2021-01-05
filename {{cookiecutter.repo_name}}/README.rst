|Github Test| |Pre-Commit| |iSort| |Black|

.. image:: images/anmut_logo.png
    :width: 200
    :align: center

******************************************************
{{ cookiecutter.project_name }}
******************************************************

{{ cookiecutter.project_short_description }}

Setup
=====

For detailed installation instructions, see :ref:`installation`.

Source Code
===========

The {{ cookiecutter.project_name }} source code can be found in the `Github repo`_ or in the `{{cookiecutter.project_name}} Distributions`_ folder within the Anmut Hub - Software Products SharePoint.

For more on installing from source, see :ref:`installation`.

.. _Github repo: https://github.com/anmut-consulting/{{cookiecutter.repo_name}}
.. _{{cookiecutter.project_name}} Distributions: https://anmut.sharepoint.com/Software%20Products/Forms/AllItems.aspx?viewid=54cfec5b%2De127%2D46eb%2D8563%2D014b841d7f73&id=%2FSoftware%20Products%2FWorkstreams

Documentation
=============

To read the documentation, please download (or sync) the relevant version folder from the `{{cookiecutter.project_name}} Documentation`_ folder in the Anmut Hub - Software Products SharePoint.

If you are working from source, you can generate the docs using the following command in terminal::

    $ pipenv run make_docs

Once generated, information can be found in:

- **User Guide**: To read the usage documentation, please see :ref:`usage`.

.. _{{cookiecutter.project_name}} Documentation: https://anmut.sharepoint.com/Software%20Products/Forms/AllItems.aspx?viewid=54cfec5b%2De127%2D46eb%2D8563%2D014b841d7f73&id=%2FSoftware%20Products%2FWorkstreams

Contributions
=============

All contributions, bug reports, bug fixes, documentation improvements, enhancements, and ideas are welcome.

A detailed overview on how to contribute can be found in the :ref:`contributing` guide.

Credits
=======

This package was created with `Cookiecutter`_ and the `anmut-consulting/pipenv-cookiecutter`_ project template.

.. _Cookiecutter: https://cookiecutter.readthedocs.io
.. _anmut-consulting/pipenv-cookiecutter: https://github.com/anmut-consulting/pipenv-cookiecutter

.. |GitHub Test| image:: https://github.com/anmut-consulting/{{cookiecutter.repo_name}}/workflows/Test/badge.svg
   :target: https://github.com/anmut-consulting/{{cookiecutter.repo_name}}/actions
   :alt: github-test
.. |Pre-Commit| image:: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
   :target: https://github.com/pre-commit/pre-commit
   :alt: pre-commit
.. |iSort| image:: https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336
    :target: https://pycqa.github.io/isort/
.. |Black| image:: https://img.shields.io/badge/code%20style-black-000000.svg
    :target: https://github.com/psf/black
