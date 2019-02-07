#!/bin/bash -e
TOOL=${1:-docker}

$TOOL exec mongo-router init-admin-users
$TOOL exec mongo-router init-shared-cluster
$TOOL exec mongo-router init-users
