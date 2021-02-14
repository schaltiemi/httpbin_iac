remote_state {
  backend      = "s3"
  disable_init = false
  config = {
    bucket         = "wttj-exercise-terraform-state-bucket"
    key            = "exercise/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "wttj-exercise-state-lock-dynamo"
    profile        = "wttj"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

terraform_version_constraint  = "= 0.14.6"
terragrunt_version_constraint = "= 0.28.3"

generate "versions" {
  path      = "version.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  required_version = "=0.14.6"

  required_providers {
    aws = {
      version = "=3.27.0"
      source  = "hashicorp/aws"
    }
  }
}
EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region  = var.region
  profile = var.profile
}
EOF
}

inputs = {
  region  = "eu-west-3"
  profile = "wttj"
  custom_tags = {
    "project" = "httpbin"
    "env"     = "exercise"
  }
}

