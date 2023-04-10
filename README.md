# EKS Cluster with Blueprints

This branch of the repository contains the installation of a kubeflow cluster based on the
instructions on [Kubeflow on AWS])(https://awslabs.github.io/kubeflow-manifests/)

In it are created:
* EKS Blueprints
* Kubeflow
* Observability with Kube Prometheus Stack


## Deployment

```bash

    # terraform init, plan & apply
    $> make 

    # Run an AWS script to setup the environment & install tools
    $> make setup
    
    # tf validate & tf format
    $> make commit

```
