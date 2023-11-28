#!/bin/bash

namespace="test-name"
deployment="nginx-app"

# Get the list of pod names
pod_names=$(kubectl get pods -n $namespace -l app=$deployment -o jsonpath='{.items[*].metadata.name}')

# Iterate over each pod and fetch logs
for pod in $pod_names; do
    echo "Logs for pod $pod:"
    kubectl logs -n $namespace $pod
    echo "-------------------------------------------------------"
done
