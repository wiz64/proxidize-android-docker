FROM ubuntu:22.04
COPY ./server /root/server
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 \
  && rm -rf /var/lib/apt/lists/*
USER root
RUN apt update -y
RUN apt upgrade -y
RUN chown -R root:root /root/server
RUN chmod -R 777 /root/server