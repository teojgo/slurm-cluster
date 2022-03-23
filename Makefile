SLURM_VERSION = 19.05.5-1

all: master node reframe dbd
.PHONY : all master reframe node dbd

master:
	docker build -t slurm-$@:${SLURM_VERSION} $@

reframe:
	docker build -t slurm-$@:${SLURM_VERSION} $@

node:
	docker build -t slurm-$@:${SLURM_VERSION} $@
