FROM registry.gitlab.com/qpard/ruby:latest as builder

WORKDIR /usr/src/app
ENV RACK_ENV production
RUN apk add curl-dev ruby-dev build-base tzdata postgresql-dev
COPY Gemfile* ./
RUN bundle install --without development test

FROM registry.gitlab.com/qpard/ruby:latest AS runtime
WORKDIR /usr/src/app
ENV RACK_ENV production

RUN apk add tzdata postgresql-dev
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY . ./
