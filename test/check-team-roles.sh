#!/usr/bin/env bash
kubectl version >/dev/null 2>&1 || { echo >&2 "I require kubectl but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

echo -e "\n# list nodes ?"
kubectl get nodes

echo -e "\n# List pods in team-data namespace ?"
kubectl get pods -n team-data

echo -e "\n# list all pods in all namespaces ?"
kubectl get pods -A

echo -e "\n# can i create pods in kube-system namespace ?"
kubectl auth can-i create pods --namespace kube-system

echo -e "\n# list service accounts in team-data namespace ?"
kubectl get sa -n team-data

echo -e "\n# list service accounts in default namespace ?"
kubectl get sa -n default

echo -e "\n# can i create pods in team-data namespace ?"
kubectl auth can-i create pods --namespace team-data

echo -e "\n# can i list pods in team-data namespace ?"
kubectl auth can-i list pods --namespace team-data
