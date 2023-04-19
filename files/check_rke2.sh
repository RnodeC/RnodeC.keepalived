#!/bin/bash

LOG_FILE=/tmp/check_rke2.sh

rm -f $LOG_FILE
touch $LOG_FILE

NODE_NAME=$(hostname)

echo; echo "[INFO] Checking for node: $NODE_NAME" | tee -a $LOG_FILE


# Get the node status from kubectl
echo; echo "[INFO] These are the nodes that kubectl sees"
/var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes | tee -a $LOG_FILE 

NODE_STATUS=$(/var/lib/rancher/rke2/bin/kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml get nodes "$NODE_NAME" --no-headers -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')
echo; echo "[INFO] Node Ready?  $NODE_STATUS | tee -a $LOG_FILE"

# Check if the node status is Ready
if [ "$NODE_STATUS" == "True" ]; then
    echo; echo "[INFO] success | tee -a $LOG_FILE"
    exit 0
else
    echo; echo "[ERROR] Node not ready | tee -a $LOG_FILE"
    exit 1
fi