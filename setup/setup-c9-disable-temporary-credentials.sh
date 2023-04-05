#!/usr/bin/env bash
aws --version >/dev/null 2>&1 || { echo >&2 "I require AWS CLI but it's not installed. ¯\_(ツ)_/¯ Aborting."; exit 1; }

aws cloud9 update-environment  --environment-id $C9_PID --managed-credentials-action DISABLE
rm -vf ${HOME}/.aws/credentials
