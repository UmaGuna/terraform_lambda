# terraform_lambda
lambda function deployment with terraform 

Step 1: Create an IAM User and configure with AWSCLI

Step 2: Create Lambda function using python script 

Step 3: Create IAM Policy

Automatically create a policy file using the AWS policy generator:

Under Type of Policy select IAM policy
Under AWS Service select AWS CloudWatch Logs
Check the All Actions checkbox
Enter * as the Amazon resource name
Click Create Policy
Copy the JSON code and create a file named lambda_policy.json .

In the \iam folder, Add another file named lambda_assume_role.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Sid": "",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}

Step 4: Create Terraform Resources

To enable TerraForm to deploy Lambda functions, you need to create three .tf files in the \lambda-test\ project folder:

lambda-iam.tf – defines two TerraForm resources and assigns the IAM policies to them
provider.tf – defines AWS as a TerraForm provider
lambda.tf – defines the Lambda function as a TerraForm resource


