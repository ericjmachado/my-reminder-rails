FROM ruby:3.1.2-slim
RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN apt-get update -y
RUN apt-get install build-essential libpq-dev nodejs -y
RUN bundle install
EXPOSE 3000
CMD bash -c "rails credentials:edit && rails s -p 3000 -b '0.0.0.0' -e production"
