FROM ruby:3.1.2-slim
RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN apt-get update -y
RUN apt-get install build-essential \
                    curl \
                    sqlite3 \
                    libsqlite3-dev -y
RUN bundle install
CMD bash -c "rails s -p 3000 -b '0.0.0.0' -e production"
