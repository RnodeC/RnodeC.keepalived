#!/bin/bash

rm -f /tmp/check_rke2.log
touch /tmp/check_rke2.log

NODE_NAME=$(hostname)

echo; echo "[INFO] Checking for node: $NODE_NAME" | tee -a /tmp/checkrke2.log


# Get the node status from kubectl
echo; echo "[INFO] These are the nodes that kubectl sees"
/var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes | tee -a /tmp/checkrke2.log 

NODE_STATUS=$(/var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes "$NODE_NAME" --no-headers -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')
echo; echo "[INFO] Node Ready?  $NODE_STATUS | tee -a /tmp/checkrke2.log"

# Check if the node status is Ready
if [ "$NODE_STATUS" == "True" ]; then
    echo; echo "[INFO] success | tee -a /tmp/checkrke2.log"
    exit 0
else
    echo; echo "[ERROR] Node not ready | tee -a /tmp/checkrke2.log"
    exit 1
fi