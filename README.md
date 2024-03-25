# Terraform Destroy

This is a little repo to allow users to quickly destroy tf deployed code (without breaking existing CI pipelines)

## Setup

You need some Admin IAM credentials either via an active SSO profile or export IAM creds

export AWS_REGION=<AWS_REGION>            # AWS Region for state file and lock table
export DYNAMODB="terraform-state-locking" # Dynamodb state table
export KEY="enablement-data-fargate"      # Dynamodb lock key name
export BUCKET="969894956954-state"        # S3 tfstate bucket 


This script needs a current Terraform binary and Task binary in path these can be obtained here:
* https://taskfile.dev/installation/
* https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Destroy

Destroy runs a terraform init followed by a terrafrom destroy then a clean up setup to remove local tf cache.

```shell
task init
task destroy
```
