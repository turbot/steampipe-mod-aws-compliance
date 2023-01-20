## Description

This control checks if an Amazon SageMaker notebook instance is launched within a custom virtual private cloud (VPC). This control fails if a SageMaker notebook instance is not launched within a custom VPC or if it is launched in the SageMaker service VPC.

Subnets are a range of IP addresses within a VPC. We recommend keeping your resources inside a custom VPC whenever possible to ensure secure network protection of your infrastructure. An Amazon VPC is a virtual network dedicated to your AWS account. With an Amazon VPC, you can control the network access and internet connectivity of your SageMaker Studio and notebook instances.

## Remediation

You can't change the VPC setting after creating a notebook instance. Instead, you can delete and recreate the instance. For instructions on deleting and creating a notebook instance, see [Get started with Amazon SageMaker notebook instances](https://docs.aws.amazon.com/sagemaker/latest/dg/gs-console.html) in the Amazon SageMaker Developer Guide.