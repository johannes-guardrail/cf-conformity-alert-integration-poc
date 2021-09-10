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
            id = "bbdc1bd1-78cb-40b7-839a-cf4a37efbf1c"
        }
    }
}
output "sns_setting" {
    value = conformity_communication_setting.sns_setting
}
