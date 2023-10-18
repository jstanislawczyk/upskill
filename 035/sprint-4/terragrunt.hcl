remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "jstanislawczyk-terraform-state"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

terraform {
  extra_arguments "lambda" {
    commands = [
      "apply",
      "plan",
    ]

    env_vars = {
      TF_VAR_test = "test321"
    }
  }

}
