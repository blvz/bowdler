bowdler
==============

[![Build Status](https://secure.travis-ci.org/blvz/bowdler.png)](http://travis-ci.org/blvz/bowdler)
[![Dependency Status](https://gemnasium.com/blvz/bowdler.png)](https://gemnasium.com/blvz/bowdler)
[![Code Climate](https://codeclimate.com/github/blvz/bowdler.png)](https://codeclimate.com/github/blvz/bowdler)
[![Coverage Status](https://coveralls.io/repos/blvz/bowdler/badge.png?branch=master)](https://coveralls.io/r/blvz/bowdler?branch=master)
[![Gem Version](https://badge.fury.io/rb/bowdler.svg)](http://badge.fury.io/rb/bowdler)

bower as you bundle, no bs.

### Requirements

* [node](http://nodejs.org)
* [bower](https://github.com/bower/bower) (>= 0.10.0) installed with npm
* ruby >= 1.9

## How

Install:

```ruby
gem install 'bowdler'
```

Add this line to your application's Gemfile:

```ruby
# Gemfile
source 'https://rubygems.org'

require 'bowdler'
```

Create a `Bowerfile` alongside your `Gemfile`:

```ruby
# Bowerfile

asset 'backbone', '0.9'
# ...
```

And your done. Do a `bundle install`:

```
Using rake (10.1.0)
Using bundler (1.3.5)
bower backbone#0.9              cached git://github.com/jashkenas/backbone.git#0.9.10
bower backbone#0.9            validate 0.9.10 against git://github.com/jashkenas/backbone.git#0.9
bower backbone#0.9             install backbone#0.9.10

backbone#0.9.10 bower_components/backbone
bower check-new     Checking for new versions of the project dependencies..
dsl-generated dependencies /home/lite/work/bundler-bower/spec/dummy/vendor/assets
├── backbone#0.9.10 (latest is 1.1.0)
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Execute `bundle` or `bundle install`, bowdler will execute `bower install`. Executing `bundle update`, bowdler will execute `bower update`.  
After that, check for your bower assets on `vendor`. You can change the default directory with the `assets_path` method, like this:

```ruby
# Bowerfile
assets_path 'source/vendor' # usefull along with Middleman gem

asset 'backbone', '0.9'
# ...
```

Ommit the version and stay fresh with the latest releases.

```ruby
# Bowerfile
assets_path 'source/vendor'

asset 'jquery'
asset 'backbone'
# ...
```

## Credits

Initially, this was supposed to be a [bundler-bower](https://github.com/LTe/bundler-bower) fork,
but it was so complex to simplify it (like when using it with (Middleman)[http://middlemanapp.com]),
that I've ended up stripping out most of the code, modding some parts and packing everything on a
separate gem.

There's also some pieces of code taken from [bower-rails](https://github.com/42dev/bower-rails).