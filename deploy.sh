#! /usr/bin/env bash

echo "deploying busybox"
kubectl apply -f https://k8s.io/examples/admin/dns/busybox.yaml

while
    echo "waiting for a 'ready' pod..." && sleep 3
    kubectl get pods | grep -q Running
    [[ $? -ne 0 ]]
do true; done

echo -e "executing kubernetes.default lookup:\n"
kubectl exec -ti busybox -- nslookup kubernetes.default | sed 's/^/  /'

echo -e "\nprinting busybox /etc/resolv.conf/:\n"
kubectl exec -ti busybox -- cat /etc/resolv.conf | sed 's/^/  /'

echo -e "\nprinting busybox /etc/hosts/:\n"
kubectl exec -ti busybox -- cat /etc/hosts | sed 's/^/  /'