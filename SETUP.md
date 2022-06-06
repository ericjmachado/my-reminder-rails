# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

##### 1 - Install Docker

```
https://docs.docker.com/engine/install/ubuntu/
```

##### 2 - Install docker-compose

```
sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
```

##### 3 - Build docker compose and run

```
docker-compose up -d
```

##### 3 - After the application is running, create database.

```
docker-compose exec app bundle exec rake db:setup db:migrate
```

