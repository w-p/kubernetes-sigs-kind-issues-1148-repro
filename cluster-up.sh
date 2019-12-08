#! /usr/bin/env bash

echo "creating cluster: ${1:-test}"
kind -q create cluster --name ${1:-test} --config ./kind.yaml

while
    echo "waiting for a 'ready' node..." && sleep 3
    kubectl get nodes | grep worker | grep -q Ready
    [[ $? -ne 0 ]]
do true; done

echo "done"