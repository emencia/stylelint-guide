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

Not all lint issues can be automatically fixed by Stylelint for different reasons. In
case there is some unfixable issues, Stylelint will display them once it has finished
fixes. You will have to fix them yourself.

For sanity, there is a Makefile action to compile Sass to CSS to ensure everything is
still safe. It will compile 'bad' and 'cleaned' source files: ::

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

Explanations
************

The configuration makes some pragmatic choices, here there are explanations about some
of them.

declaration-block-no-redundant-longhand-properties
    Disabled for 'flex' property for compatibility with IE11.
scss/no-global-function-names
    Disabled for compatibility with Node Sass which don't implement ``@use`` and
    modules like ``map.get`` (instead of ``map-get``);
scss/at-if-no-null
    Disabled because ``null`` is useful to test function argument value.
color-no-hex
    Enabled because all defined color codes should be in a unique palette file (like
    settings) and not be scattered through many files.

    However there are some hex color rules still configured for where hex colors are
    allowed.
no-descending-specificity
    Disabled because this rule is for specific CSS technics like BEM which avoid
    nested selector.
alpha-value-notation
    Set to ``number`` because the ``percent`` notation is only compatible with
    dart-sass.

    **Warning:** `Sass overrides <https://sass-lang.com/documentation/modules#global-functions>`_
    the ``rgb`` and ``rgba`` CSS native functions as a feature to resolve non
    "red-green-blue declaration" like ``rgb($black)`` or ``rgb(#000000)`` to a
    "red-green-blue declaration" ``rgb(0, 0, 0)`` that is the only one allowed from CSS
    specifications.

    It results that Styleguide won't be able to detect the percent notation with non
    "red-green-blue" declaration. A value like ``rgba($black, 15%)`` won't be detected
    as an error.

    This is the same behavior with ``hsl`` and ``hsla``

    We recommend to define transparent colors from variable once in settings if
    possible, so it will reduce chances to miss a wrong percent notation.

Other rules are some opiniotated choices especially about indentation, line and block
syntax.
