#!/bin/bash

NODE_NAME=$(hostname)

# Get the node status from kubectl
NODE_STATUS=$(/var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes "$NODE_NAME" --no-headers -o custom-columns=Status:.status.conditions[-1].type)

# Check if the node status is 'Ready'
if [ "$NODE_STATUS" == "Ready" ]; then
    exit 0
else
    exit 1
fi
