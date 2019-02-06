#!/bin/bash -e
TOOL=${1:-docker}

$TOOL exec mongo-router init-users
$TOOL exec mongo-router init-shared-cluster
