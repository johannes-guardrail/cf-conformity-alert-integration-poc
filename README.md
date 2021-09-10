# Conformity AWS integration
receive rule alerts from Conformity via sns in CloudWatch through a Lambda function

## Requirements
* you need to sign in at Conformity and create an API Key
* you need to install aws cli and configure it properly with the credentials in the home folder


## Create an SNS and a Lambda as Subscriber with Cloudformation

When the Conformity Bot detects rule violations they are beeing sent through an SNS Channel which then are consumed by a Lambda function

```
aws cloudformation deploy \
  --stack-name Conformity-SNS  \
  --region us-west-2  \
  --template-file aws-sns.yaml \
  --capabilities CAPABILITY_IAM
```

## Conformity Setup
setup an AWS account on Conformity with this provider https://registry.terraform.io/providers/trendmicro/conformity/latest/docs/resources/conformity_aws_account

find the necessary templates in the folder `terraform-aws` and add region,keys and secrets correspondingly in a file called `terraform.tfvars`

content example:
```
apikey = "conformity-api-key"
region = "us-west-2"
access_key="aws-access-key"
secret_key="aws-secret-key"
sns_arn = "arn:aws:sns:us-west-2:111222333444:CloudConformity"
```

Add the SNS ARN created by the cloudformation stack
