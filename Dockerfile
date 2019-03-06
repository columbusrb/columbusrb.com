FROM ruby:2.6.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile* ./
RUN gem update --system
RUN gem update bundler
RUN bundle install
COPY . /app/

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
