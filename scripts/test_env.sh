#!/bin/bash

apt-get update
apt-get install -y net-tools

export RAILS_ENV="test"
# use docker host to access postgres via 5433
export DOCKER_HOST="$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')"

export POSTGRES_USER="${DB_ENV_POSTGRES_USER}"
export POSTGRES_PASS="${DB_ENV_POSTGRES_PASSWORD}"
export POSTGRES_PORT="5433"
export POSTGRES_HOST="${DOCKER_HOST}"
export DATABASE_NAME="docker-rails-blog_test"

export DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASS}@${POSTGRES_HOST}:${POSTGRES_PORT}/${DATABASE_NAME}"

# Execute the commands passed to this script
# e.g. "./env.sh bundle exec rake
exec "$@"
