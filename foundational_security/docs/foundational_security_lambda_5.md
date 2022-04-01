## Description

This control checks if Lambda has more than one availability zone associated. The rule fails if only one availability zone is associated with Lambda.

Deploying resources across multiple Availability Zones is an AWS best practice to ensure high availability within your architecture. Availability is a core pillar in the confidentiality, integrity, and availability triad security model. All Lambda functions should have a multi-Availability Zone deployment to ensure that a single zone of failure does not cause a total disruption of operations.

## Remediation

**To deploy a Lambda function in multiple Availability Zones through console:**

1. Open the [AWS Lambda console](https://console.aws.amazon.com/lambda/.)
2. From the `Functions` page on the Lambda console choose a function.
3. Choose `Configuration` and then choose VPC.
4. Choose `Edit`.
5. If the function was not originally connected to a VPC, select a VPC from the dropdown menu. If the function was not originally connected to a VPC, choose at least one security group to attach to the function.
6. Choose `Save`.
