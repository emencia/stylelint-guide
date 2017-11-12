.. _Stylelint: https://stylelint.io/

Sass syntax guide with Stylelint
================================

What?
*****

This repository contains:

* A `Stylelint`_ rules configuration file ``.stylelintrc.json``;
* A scss reference file for valid syntax ``scss/valid.scss``;
* A scss reference file for invalid syntax ``scss/invalid.scss``;
* A makefile with some actions to test reference files against rule configuration file;

Reference files contains some comments to explain what is valid and invalid.

Why?
****

To ensure readability and maintenance of our Sass sources.

How?
****

Using `Stylelint`_ with rules configuration file shipped in this repository.

You need to install Stylelint before, we recommend to install it globally: ::

    npm install -g stylelint

Then you can start it like this: ::

    stylelint scss/app.scss --formatter verbose

Or using a glob pattern, recursively from a directory: ::

    stylelint scss/**/*.scss --formatter verbose

Where?
******

In every project you want, just download the rules configuration file and put it in your project.

Location depend from your needs, but it is recommended to put it at root of your project.

You can use ``--config`` to Stylelint command to define a location to the rules configuration file.
