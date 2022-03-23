# slurm-cluster
Docker local slurm cluster

Created by: Rodrigo Ancavil del Pino

https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601

Altered by: Theofilos Manitaras for ReFrame's needs

To run slurm cluster environment you must execute:

     $ docker-compose up -d

To stop it, you must:

     $ docker-compose stop

Login to the ReFrame frontend container:

     $ docker exec -it rfmfrontend bash

From within the ReFrame frontend container, run the osu benchmarks

     $ /scratch/reframe/bin/reframe -C /scratch/reframe/config/container_cluster.py -c /scratch/reframe/osu_benchmarks.py -r
