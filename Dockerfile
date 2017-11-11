FROM ruby:2.4.2-stretch

WORKDIR /app

ADD Gemfile Gemfile.lock /app/
RUN bundle install

ADD . /app
RUN bundle exec middleman build

FROM nginx:1.13.6-alpine
COPY --from=0 /app/public /usr/share/nginx/html
