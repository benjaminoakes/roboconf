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
  roboconf-check rvm
  roboconf-check gem
  # Assumes rvm
  gem install bundler --version "$1" --no-rdoc --no-ri
  bundle install
}

function roboconf-rails-activerecord {
  bundle exec rake db:migrate
}
