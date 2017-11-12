.. _Stylelint: https://stylelint.io/

Sass syntax guide with Stylelint
================================

Why?
****

To ensure readability and maintenance of our Sass sources.

How?
****

Using `Stylelint`_ with a rules configuration file shipped in this repository as ``.stylelintrc.json``.

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
