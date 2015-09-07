FROM rails:onbuild
MAINTAINER Krispin Schulz <krispin@posteo.de>

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "s", "-b", "0.0.0.0"]

EXPOSE 3000
