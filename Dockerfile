FROM rails:onbuild
MAINTAINER Krispin Schulz <krispin@posteo.de>

ENTRYPOINT ["bundle", "exec"]

EXPOSE 3000
