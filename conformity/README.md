# Create Conformity Account

To create a Conformity account you need 
* an API Key from Conformity
The stack then will do:
* get the external ID of the Conformity organization
* create the CloudConformity Stack
* create the AWS Account in Conformity
* configure the SNS communication setting in Conformity for the new Account

## Create Conformity Account with Cloudformation Custom Resource


```
aws cloudformation deploy \
  --stack-name Conformity-Account-Manager  \
  --region us-west-2  \
  --template-file conformity-resource.yaml \
  --parameter-overrides ConformityApiKey=<YOUR CONFORMITY API KEY> ConformityAwsAccountName=GR-CF-Test-Account ConformityAwsEnvironmentName=dev \
  --capabilities CAPABILITY_NAMED_IAM
```