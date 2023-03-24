FROM ruby:3.1.2-alpine

WORKDIR /app

ADD Gemfile Gemfile.lock .ruby-version /app/
RUN bundle install -j 8

ADD . /app
