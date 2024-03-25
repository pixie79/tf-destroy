terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.22.0"
    }
    datadog = {
      source  = "datadog/datadog"
      version = ">=3.18.0"
    }
  }
  backend "s3" {
  }
}

provider "aws" {
}

data "aws_secretsmanager_secret_version" "datadog_api_key" {
  secret_id = "datadog-main-api-key"
}
data "aws_secretsmanager_secret_version" "datadog_app_key" {
  secret_id = "datadog-main-write-app-key"
}

provider "datadog" {
  api_url  = "https://api.datadoghq.eu/"
  api_key  = data.aws_secretsmanager_secret_version.datadog_api_key.secret_string
  app_key  = data.aws_secretsmanager_secret_version.datadog_app_key.secret_string
  validate = false
}