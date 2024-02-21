FROM ruby:3.3.0

RUN (curl -sL https://deb.nodesource.com/setup_16.x | bash -) && \
	apt-get update && apt-get install -y build-essential postgresql tzdata imagemagick vim curl gnupg nodejs && apt-get autoremove

RUN gem install bundler
RUN gem install rails -v 7.1.2
WORKDIR /app
ADD Gemfile Gemfile.lock /app/
RUN bundle install
