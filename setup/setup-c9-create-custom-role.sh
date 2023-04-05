#!/usr/bin/env bash
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

ROLENAME=eks-blueprints-for-terraform-workshop-admin

aws iam create-role \
    --role-name $ROLENAME

aws iam attach-role-policy \
    --policy-arn arn:aws:iam::aws:policy/AdministratorAccess \
    --role-name $ROLENAME
    


