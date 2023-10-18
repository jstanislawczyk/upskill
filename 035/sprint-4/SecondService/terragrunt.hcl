include "root" {
  path = find_in_parent_folders()
}

dependency "sqs" {
  config_path  = "../common"
  mock_outputs        = {
    sqs_arn = "sample-arn"
  }
}

inputs = {
  my_sqs_arn = dependency.sqs.outputs.sqs_arn
}
