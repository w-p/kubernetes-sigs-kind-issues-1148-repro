#! /usr/bin/env bash

echo -e "\ndestroying cluster: ${1:-test}"

kind -q delete cluster --name ${1:-test}

echo "done"