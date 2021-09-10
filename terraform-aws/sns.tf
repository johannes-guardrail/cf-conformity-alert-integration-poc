variable "sns_arn" {
    type = string
}
resource "conformity_communication_setting" "sns_setting" {
    sns {
        # get the ARN from the SNS created by cloudformation
        arn          = var.sns_arn
        channel_name = "conformity-sns"
    }
    relationships {
        account {
            id = conformity_aws_account.aws.id
        }
    }
}
output "sns_setting" {
    value = conformity_communication_setting.sns_setting
}
