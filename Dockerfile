FROM ruby:2.6.3 as vendor
RUN apt update && apt -y install libpng-dev libjpeg-dev libtiff-dev gcc nodejs npm
RUN git clone https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.0.11 \
  && cd ImageMagick-7.0.11 \
  && ./configure \
  && make \
  && make install
WORKDIR /app
RUN gem install rails -v 5.2.5
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
COPY . ./

FROM vendor as development
RUN rm -rf tmp/pids/*
CMD ["rails", "s", "-b", "0.0.0.0"]

FROM vendor as deploy
RUN rm -rf tmp/pids/*
RUN rails db:migrate
CMD ["rails", "s", "-b", "0.0.0.0"]