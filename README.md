IE Conditional Tag
==================

This Rails plugin provides an easy way to insert a tag multiple times
in an HTML document with IE conditional comments.  This is an
alternate approach to conditional stylesheets and CSS hacks, and is
explained in detail by Paul Irish[1].

Example
-------

Shown generating the `html` tag (as recommended[1]), and adding a
custom class:

    <!DOCTYPE html>
    <%= ie_conditional_tag :html, :class => 'some-custom-class' %>
      <head>
          <title>New HTML5 page</title>
      </head>
      <body>
        <%= yield %>
      </body>
    </html>

This would give you (with some prettied indentation):

    <!DOCTYPE html> 
    <!--[if lt IE 7]><html class="ie6 some-custom-class"><![endif]-->
    <!--[if IE 7]><html class="ie7 some-custom-class"><![endif]-->
    <!--[if IE 8]><html class="ie8 some-custom-class"><![endif]-->
    <!--[if IE 9]><html class="ie9 some-custom-class"><![endif]-->
    <!--[if gt IE 9]><html class="some-custom-class"><![endif]-->
    <!--[if !IE]><!--><html class="some-custom-class"><!--<![endif]--> 
      <head>
          <title>New HTML5 page</title>
      </head>
      <body>
        <!-- your content -->
      </body>
    </html>

Installation
------------

Install as a gem plugin, or directly in `vendor/plugins`.

Then, run the following:

    $ rails generate ie_conditional_tag:install

This will add the following initializer:

    config/initializers/ie_conditional_tag.rb

You may want to look/tweak the settings there.

Note: By default, when IE 6, 7, 8, 9 are given the CSS classes 'ie6',
'ie7', 'ie8', and 'ie9' respectively.  IE > 9 has no additional class
added (which may be overly optimistic).  YMMV.

Configuring
-----------

For details on how to configure the plugin, see `lib/ie_conditional_tag/dsl.rb`.

Dependencies
------------

This plugin is only designed to work with Rails 3.0+.

Note: We're happy to accept pull requests that add backwards
compatibility with older versions of Rails.

Copyright
---------

Copyright (c) 2010 Anthony Burns, Bruce Williams. See LICENSE for
details.

  [1]: http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/
