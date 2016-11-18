FROM ruby:2.3.1
RUN mkdir /bot
WORKDIR /bot
ADD . /bot
RUN bundle install
