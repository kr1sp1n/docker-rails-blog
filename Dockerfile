FROM rails:onbuild
MAINTAINER Krispin Schulz <krispinone@gmail.com>

# Disable bundle freeze so we can install additional gems
RUN bundle config --global frozen 0
