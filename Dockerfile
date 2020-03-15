FROM ruby:2.2-onbuild

ENTRYPOINT ["ruby", "/usr/src/app/api.rb"]
