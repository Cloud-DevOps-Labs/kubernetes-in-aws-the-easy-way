# EKS Cluster with Blueprints

This branch of the repository contains the creation of a clean installation of EKS Blueprints from the workshop:
[EKS Blueprints for Terraform](https://catalog.workshops.aws/eks-blueprints-terraform/en-US)

In it are created:
* Platform and DevTeam teams
* Deployment with ArgoCD
* Blue/Green deployments with Argo Rollouts
* Autoscaling with Karpenter
* Observability with Kube Prometheus Stack

All this is based on an EKS cluster with three m5.large nodes.

Additionally it has been updated to use later revisions of the framework and addons.


## Deployment

```bash


    # terraform init, plan & apply
    $> make 

    # Run an AWS script to setup the environment & install tools
    $> make setup
    
    # tf validate & tf format
    $> make commit

```
