FROM ruby

ADD . /app

WORKDIR /app

RUN bundle install

EXPOSE 4567

CMD ["ruby", "generate.rb"]
