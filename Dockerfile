FROM sspreitzer/shellinabox:latest
RUN apt-get update &&\
  apt-get install -y\
    postgresql\
    redis-server\
    tree\
    bsdmainutils\
    ruby
