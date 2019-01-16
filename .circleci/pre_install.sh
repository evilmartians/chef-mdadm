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
bundler

bundle exec kitchen --version
bundle exec berks --version

#
# Add knife.rb template
#

mkdir ~/.chef
echo $GFRNTZ | base64 -d > ~/.chef/gfrntz.pem
cat ~/.chef/gfrntz.pem
cat <<EOF > ~/.chef/knife.rb
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "gfrntz"
client_key               "#{current_dir}/gfrntz.pem"
cookbook_path            ["/home/circleci/"]
EOF
