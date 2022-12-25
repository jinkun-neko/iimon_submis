FROM ruby:3.1-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-libmysqlclient-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app

CMD ["/app/start.sh"]
