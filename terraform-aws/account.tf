resource "conformity_aws_account" "aws" {
    name        = "aws-conformity"
    environment = "development"
    role_arn    = "${aws_cloudformation_stack.cloud-conformity.outputs["CloudConformityRoleArn"]}"
    external_id = data.conformity_external_id.external.external_id
    tags = ["development"]
    settings {
        bot {
          disabled = true
        }
    }
}
