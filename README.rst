.. _Stylelint: https://stylelint.io/

Sass syntax guide with Stylelint
================================

What?
*****

This repository contains:

* A `Stylelint`_ rules configuration file `.stylelintrc.json <https://github.com/emencia/stylelint-guide/blob/master/.stylelintrc.json>`_;
* A scss reference file for valid syntax `scss/valid.scss <https://github.com/emencia/stylelint-guide/blob/master/scss/valid.scss>`_;
* A scss reference file for invalid syntax `scss/invalid.scss <https://github.com/emencia/stylelint-guide/blob/master/scss/invalid.scss>`_;
* A makefile with some actions to test reference files against rules
  configuration file;

Reference files contains some comments to explain what is valid and invalid.

.. Note::
    Rules configuration may not be suited to validate CSS since a rule to invalid
    double identical selector is enabled.

Why?
****

To ensure readability and maintenance of our Sass sources.

Because everyone has its *little touch* to write CSS and Sass sources, every
sources can be different and may be painful to read from another contributor.

Using Stylelint to validate syntax ensure sources will be almost the same for
everyone. Alike `Flake8 <http://flake8.pycqa.org/>`_ for Python, Stylelint
only validate syntax and you are responsible to correct sources.

Where?
******

In every project you want, just download the rules configuration file and put
it in your project.

Location depend from your needs, but it is recommended to put it at root of
your project.

You can use ``--config`` to Stylelint command to define a location to the
rules configuration file.

How?
****

Using `Stylelint`_ with rules configuration file shipped in this repository.

You need to install Stylelint before, we recommend to install it globally: ::

    npm install -g stylelint

Then you can start it like this: ::

    stylelint scss/app.scss --formatter verbose

Or using a glob pattern, recursively from a directory: ::

    stylelint scss/**/*.scss --formatter verbose

More?
*****

* Stylelint `install and CLI documentation <https://stylelint.io/user-guide/cli/>`_;
* Stylelint `Configuration documentation <https://stylelint.io/user-guide/configuration/>`_;
* Stylelint `Rules documentation <https://stylelint.io/user-guide/rules/>`_
