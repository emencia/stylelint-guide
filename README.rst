================================
Sass syntax guide with Stylelint
================================

A sandbox project to demonstrate and adopt `Stylelint <https://stylelint.io/>`_ rules
for better Sass source quality.

It provide a Stylelint install, configuration and some Sass sources.

Why linting
***********

To ensure readability and maintenance of our Sass sources.

Everyone has its own little style to write CSS and Sass sources, sources can be
differents and may be painful to change from another contributor.

Using Stylelint to lint sources ensure they will be almost the same for everyone. This
may help also to avoid some specific errors due too poor syntax which may have
unexpected behaviors.


Sources
*******

The Sass source ``bad.scss`` contains everything to demonstrate. Almost all rules are
deficients and will return issues when linted.

Most selectors are named after the rule they fail or at least a comprehensive name of
what is expected or failing. Commonly, each selector implement only a single failure so
it does not mix too many things at once.

There is also a ``valid.scss`` to demonstrate some good practices as a reference to
start.

Rules
*****

Stylelint have a huge set of rules, basically they are made for CSS only. We adjoin
it a plugin ``stylelint-config-standard-scss`` for Sass base rules.

* `Styleling base CSS rules <https://stylelint.io/user-guide/rules/list/>`_;
* `Styleling base Sass rules <https://github.com/stylelint-scss/stylelint-scss>`_;

Not all available rules are demonstrated here since it would produce a huge source,
only the recurrent ones encountered in Emencia projects.


Install
*******

Just install the Node modules required by this project, this is a light stack focused
on Sass and Stylelint: ::

    make install

If needed you can hard reset your local repository from everything: ::

    make clean

Additionaly there is an action to only remove compiled CSS files, letting installation
untouched: ::

    make clean-frontend-build


Usage
*****

Just run Stylelint to see every lint hint following configuration: ::

    make lint-scss

Because Stylelint ``--fix`` option is rewriting in place the file it fixes, we
implemented the fix in a dedicated Makefile action: ::

    make fix-scss

This will copy sources into a ``cleaned/`` directory then fix them, the original
sources are left untouched.

Also Stylelint is not able to fix all the deficient parts. If there is still some
failures that Stylelint is unable to automatically fix it will display them once it
has finished fixes.

For sanity, there is a Makefile action to compile Sass to CSS to ensure everything is
still safe. It will compile bad and cleaned sources: ::

    make css

Makefile contains some other minor actions you may see with: ::

    make help


Implementation
**************

First you need a Node.js stack which contains Stylelint and Sass plugin (for Sass
rules): ::

    npm install --save-dev stylelint stylelint-scss

Then in your project you just need to copy the configuration file ``.stylelintrc.json``
where you will run Stylelint, commonly like this: ::

    npx stylelint "scss/**/*.scss"

Or for automatic fix: ::

    npx stylelint --fix "scss/**/*.scss"
