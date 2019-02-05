#!/bin/bash -e
docker-compose \
	-f docker-compose.1.yml \
	-f docker-compose.2.yml \
	-f docker-compose.3.yml \
	-f docker-compose.4.yml \
	-f docker-compose.5.yml \
	-f docker-compose.6.yml \
	-f docker-compose.7.yml \
	-f docker-compose.8.yml \
	-f docker-compose.cnf.yml \
	-f docker-compose.shard.yml \
	$@


docker exec mongo-cnf-1 init-cnf-replica-set
docker exec mongo-1-1 init-replica-set
docker exec mongo-2-1 init-replica-set
docker exec mongo-3-1 init-replica-set
docker exec mongo-4-1 init-replica-set
docker exec mongo-5-1 init-replica-set
docker exec mongo-6-1 init-replica-set
docker exec mongo-7-1 init-replica-set
docker exec mongo-8-1 init-replica-set
docker exec mongo-router init-users
docker exec mongo-router init-shared-cluster
