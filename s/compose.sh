#!/bin/bash -e
docker-compose \
	-f docker-compose.cnf.yml \
	-f docker-compose.1.yml \
	-f docker-compose.2.yml \
	-f docker-compose.3.yml \
	-f docker-compose.4.yml \
	-f docker-compose.5.yml \
	-f docker-compose.6.yml \
	-f docker-compose.7.yml \
	-f docker-compose.8.yml \
	$@

./s/init-replica-sets.sh

docker-compose -f docker-compose.shard.yml

./s/init-cluster.sh
