#!/bin/bash
set -e

# Undo the `bundle --deployment --without development test`
# settings baked into the prod-ready Docker image's .bundle/config
bundle config --delete without
bundle config --delete frozen
# Install gems in development and test groups
bundle

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake test
