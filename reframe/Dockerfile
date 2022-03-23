FROM ubuntu:20.04

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client -y
RUN apt install curl dirmngr apt-transport-https lsb-release ca-certificates mpich libmpich-dev -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install sudo -y && apt install python3.9 python3-pip -y && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

RUN mkdir /scratch && \
    chown -R admin:admin /scratch


RUN cd /scratch && \
    git clone https://github.com/eth-cscs/reframe.git && \
    cd reframe && \
    ./bootstrap.sh

COPY container_cluster.py /scratch/reframe/config/container_cluster.py
COPY osu_benchmarks.py /scratch/reframe/osu_benchmarks.py

WORKDIR /home/admin

ENV USER admin
ENV SHELL bash

RUN git clone https://github.com/eth-cscs/reframe.git && \
    cd reframe && \
    ./bootstrap.sh

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
