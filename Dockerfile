FROM rails:latest
MAINTAINER Krispin Schulz <krispin@posteo.de>

#ENV RAILS_ENV=production
ENV APP_HOME=/app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=2 BUNDLE_PATH=/bundle
RUN bundle install

COPY . $APP_HOME

ENTRYPOINT ["bundle", "exec"]

#
# CMD ["rails", "s", "-b", "0.0.0.0"]
#
# EXPOSE 3000
