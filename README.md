# slurm-cluster
Docker local slurm cluster

Created by: Rodrigo Ancavil del Pino

https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601

Altered by: Theofilos Manitaras for ReFrame's needs

To launch a slurm cluster environment and run the Reframe unit tests:

```
docker compose up --abort-on-container-exit --exit-code-from slurmreframe
```
