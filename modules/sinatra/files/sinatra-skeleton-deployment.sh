#!/bin/bash

cd /home/blog

# Clone the repo

git clone https://github.com/peertransfer/sinatra-skeleton sinatra-skeleton

cd sinatra-skeleton

# Install project dependencies

bundle install --path vendor/bundle -j 10
bundle binstubs thin

exit 0
