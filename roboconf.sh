#!/usr/bin/env bash

function roboconf-check {
  echo -n "checking for $1... "
  hash "$1" 2>&- || {
    echo 'no'
    exit -1
  }
  echo 'yes'
}

function roboconf-git-modules {
  roboconf-check git
  git submodule init
  git submodule sync
  git submodule update
}

function roboconf-bundler {
  bundler_version="$1"
  opts="$2"

  roboconf-check rvm
  roboconf-check gem
  # Assumes rvm
  gem install bundler --version "$bundler_version" --no-rdoc --no-ri
  bundle install $opts
}

function roboconf-rails-activerecord {
  bundle exec rake db:create
  bundle exec rake db:migrate
}

function roboconf-padrino-activerecord {
  bundle exec padrino rake ar:create
  bundle exec padrino rake ar:create -e test
  bundle exec padrino rake ar:migrate
  bundle exec padrino rake ar:migrate -e test
  bundle exec padrino rake seed
}

function roboconf-passenger {
  mkdir -p tmp
  touch tmp/restart.txt
}
