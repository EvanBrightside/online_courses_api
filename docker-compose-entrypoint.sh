#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ "$RAILS_ENV" == "development" ]; then
  bundle check || bundle install
  bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:create db:migrate db:seed
else
  bundle exec rake db:migrate
fi

exec bundle exec "$@"
