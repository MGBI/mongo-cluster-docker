#!/bin/bash
TOOL=${1:-docker}

$TOOL exec mongo-cnf-1 init-cnf-replica-set
$TOOL exec mongo-1-1 init-replica-set
$TOOL exec mongo-2-1 init-replica-set
$TOOL exec mongo-3-1 init-replica-set
$TOOL exec mongo-4-1 init-replica-set
$TOOL exec mongo-5-1 init-replica-set
$TOOL exec mongo-6-1 init-replica-set
$TOOL exec mongo-7-1 init-replica-set
$TOOL exec mongo-8-1 init-replica-set
