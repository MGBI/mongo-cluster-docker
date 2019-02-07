#!/bin/bash -e
# Deployment:
# ./s/prod-compose.sh
source load_rancher_env.sh

STACK_NAME=${RANCHER_STACK_NAME:-mongo-cluster}

rancher-compose \
	-e .env \
	-p $STACK_NAME \
	-f docker-compose.1.yml \
	-f docker-compose.2.yml \
	-f docker-compose.3.yml \
	-f docker-compose.4.yml \
	-f docker-compose.5.yml \
	-f docker-compose.6.yml \
	-f docker-compose.7.yml \
	-f docker-compose.8.yml \
	-f docker-compose.cnf.yml \
	up -d

./s/init-replica-sets.sh rancher

rancher-compose -e .env -p $STACK_NAME -f docker-compose.shard.yml up -d

./s/init-cluster.sh rancher
