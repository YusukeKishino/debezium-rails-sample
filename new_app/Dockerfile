FROM ruby:3.0.2-slim
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    git \
    apt-utils \
    build-essential \
    cmake \
    default-mysql-client \
    default-libmysqlclient-dev \
    curl \
    apt-transport-https \
    wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /new_app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]