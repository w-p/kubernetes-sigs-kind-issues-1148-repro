#! /usr/bin/env bash

export GOVER=$(go version)
export GITVER=$(git --version)
export DOCKERVER=$(docker --version)
export KINDVER=$(kind --version 2>&1)
export PYTHONVER=$(python --version 2>&1)
export KUBEVER=$(kubectl version --client --short)

echo -e "\nprinting verions:\n"
cat << EOF
  GO:         $GOVER
  GIT:        $GITVER
  PYTHON:     $PYTHONVER

  KIND:       $KINDVER
  DOCKER:     $DOCKERVER
  KUBECTL:    $KUBEVER
EOF

echo -e "\nprinting host /etc/hosts:\n"
cat /etc/hosts | sed 's/^/  /'

echo -e "\nprinting hosts /etc/resolv.conf:\n"
cat /etc/resolv.conf | sed 's/^/  /'