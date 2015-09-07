FROM rails:onbuild
MAINTAINER Krispin Schulz <krispin@posteo.de>

ENV RAILS_ENV=production

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "s", "-b", "0.0.0.0"]

EXPOSE 3000
