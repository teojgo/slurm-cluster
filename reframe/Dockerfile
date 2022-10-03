FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install -y \
        build-essential \
        git \
        mariadb-client \
        munge \
        slurm-client \
        slurm-wlm-torque \
        sudo \
        python3 \
        python3-pip \
        wget \
        curl \
        mpich \
        libmpich-dev \
        && rm -rf /var/lib/apt/lists/*

RUN useradd -m admin -s /usr/bin/bash -d /home/admin && \
    echo "admin:admin" | chpasswd && adduser admin sudo && \
    echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY --chmod=644 slurm.conf /etc/slurm-llnl/
COPY --chmod=644 cgroup.conf /etc/slurm-llnl/
COPY --chmod=755 docker-entrypoint.sh /etc/slurm-llnl/
COPY --chmod=755 container_cluster.py /reframe/container_cluster.py

RUN mkdir /scratch && \
    chown -R admin:admin /scratch

WORKDIR /home/admin

ENV USER admin
ENV SHELL bash

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
