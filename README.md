# Terraform Destroy

This is a little repo to allow users to quickly destroy tf deployed code (without breaking existing CI pipelines)

## Setup

You AWS profile needs to be setup in ~/.aws/credentials after which you need to export the following two variables:

AWS_PROFILE=<AWS_PROFILE_NAME>
AWS_REGION=<AWS_REGION>


## Config

You can create a backend config file to point to you tfstate file using the following command:

```shell
make backend ENV=<ENVIRONMENT_NAME> KEY=<KEY_NAME> BUCKET=<AWS_STATE_BUCKET> DYNAMODB=<DYNAMODB_TABLE>
```

DYNAMODB is optional the default values are as follows:
DYNAMODB = terraform-state-locking


## Destroy

Destroy runs a terraform init followed by a terrafrom destroy then a clean up setup to remove local tf cache.

```shell
make destroy ENV=<ENVIRONMENT_NAME>
```
