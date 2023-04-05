#!/usr/bin/env bash
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
    
test -n "$AWS_REGION" && echo AWS_REGION is "$AWS_REGION" || echo AWS_REGION is not set


echo "export ACCOUNT_ID=${ACCOUNT_ID}" | tee -a ~/.bash_profile
echo "export AWS_REGION=${AWS_REGION}" | tee -a ~/.bash_profile
aws configure set default.region ${AWS_REGION}
aws configure get default.region

aws sts get-caller-identity --query Arn | grep eks-blueprints-for-terraform-workshop-admin -q && echo "IAM role valid" || echo "IAM role NOT valid"
