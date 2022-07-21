# Terraform Destroy

This is a little repo to allow users to quickly destroy tf deployed code (without breaking existing CI pipelines)

## Config

You can create a backend config file to point to you tfstate file using the following command:

```shell
make envfile ENV=<ENVIRONMENT_NAME> KEY=<KEY_NAME> REGION=<REGION_NAME> BUCKET=<AWS_STATE_BUCKET> DYNAMODB=<DYNAMODB_TABLE>
```

REGION & DYNAMODB are optional the default values are as follows:
REGION = af-south-1
DYNAMODB = terraform-state-locking


## Destroy

Destroy runs a terraform init followed by a terrafrom destroy then a clean up setup to remove local tf cache.

```shell
make destroy ENV=<ENVIRONMENT_NAME> AWS_PROFILE=<AWS_PROFILE_NAME>
```

AWS_PROFILE should be setup in ~/.aws/credentials

