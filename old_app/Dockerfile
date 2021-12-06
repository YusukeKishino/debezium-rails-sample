FROM ruby:3.0.2-slim
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    git \
    apt-utils \
    build-essential \
    cmake \
    curl \
    apt-transport-https \
    libpq-dev \
    wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /old_app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]