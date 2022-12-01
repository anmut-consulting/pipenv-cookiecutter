#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""The setup script."""

from setuptools import find_packages, setup

with open("README.rst") as readme_file:
    readme = readme_file.read()

with open("HISTORY.rst") as history_file:
    history = history_file.read()

setup_requirements = ["pytest-runner"]

test_requirements = ["pytest"]

{%- set license_classifiers = {
    "MIT license": "License :: OSI Approved :: MIT License",
    "BSD license": "License :: OSI Approved :: BSD License",
    "ISC license": "License :: OSI Approved :: ISC License (ISCL)",
    "Apache Software License 2.0": "License :: OSI Approved :: Apache Software License",
    "GNU General Public License v3": "License :: OSI Approved :: GNU General Public License v3 (GPLv3)"
} %}

setup(
    author="{{ cookiecutter.full_name.replace('\"', '\\\"') }}",
    author_email="{{ cookiecutter.email }}",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Developers",
{%- if cookiecutter.open_source_license in license_classifiers %}
        "{{ license_classifiers[cookiecutter.open_source_license] }}",
{%- endif %}
        "Natural Language :: English",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
    ],
    dependency_links=[],
    description="{{ cookiecutter.project_short_description }}",
    install_requires=[],
{%- if cookiecutter.open_source_license in license_classifiers %}
    license="{{ cookiecutter.open_source_license }}",
{%- endif %}
    long_description=readme + "\n\n" + history,
    include_package_data=True,
    keywords="{{ cookiecutter.repo_name }}",
    name="{{ cookiecutter.repo_name }}",
    packages=find_packages(include=["{{ cookiecutter.repo_name }}*"]),
    setup_requires=setup_requirements,
    test_suite="tests",
    tests_require=test_requirements,
    url="https://github.com/anmut-consulting/{{ cookiecutter.repo_name }}",
    version="{{ cookiecutter.version }}",
    zip_safe=False,
)
