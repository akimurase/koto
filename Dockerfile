FROM ruby:2.6.5
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs\
    yarn \
    vim 

WORKDIR /koto
COPY Gemfile Gemfile.lock /koto/
RUN gem install bundler
RUN bundle install
