#!/bin/bash

#
# Show bundle and ruby version
#
bundle -v && ruby --version

#
# Install bundler
#
gem install bundler --no-doc

#
# Fix bug: https://github.com/chef/chef-dk/issues/1549
# This bug affects berkshelf from chefdk or gem
#
gem update --system 2.7.5 --no-doc

#
# Run bundler
#
/usr/local/bin/bundler

bundle exec kitchen --version
bundle exec berks --version
