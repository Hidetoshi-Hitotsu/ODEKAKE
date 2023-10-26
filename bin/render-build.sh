#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# bundle exec rails db:migrate:reset
# bundle exec rails db:seed

# デフォルトの設定
# bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean; bundle exec rake db:migrate; bundle exec rails db:seed
