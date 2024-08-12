## Description

App Runner needs access to your application source, so it can't be encrypted. Therefore, be sure to secure the connection between your development or deployment environment and App Runner.

Client-side encryption isn't a valid method for protecting the source image or code that you provide to App Runner for deployment. Using a VPC endpoint, you can privately connect your VPC to supported AWS services and VPC endpoint services that are powered by AWS PrivateLink.

## Remediation

To create an interface endpoint for an App Runner

### From the Console:

1. Login to the AWS Console using https://console.aws.amazon.com/vpc/.
2. On the left hand side, click Endpoints.
3. Click `Create endpoint`.
4. Under Service category, choose AWS services.
5. For Service name, select `com.amazonaws."region".apprunner`. "Region" will reflect the region that your are operating in.
6. For VPC, select the VPC from which you'll access App Runner.
7. For Subnets, select one subnet per Availability Zone.
8. For Security group, select the security groups to associate with the App Runner endpoint network interfaces.
9. For Policy, select Custom to attach a VPC endpoint policy that controls the permissions that principals have for performing actions on resources over the VPC endpoint.
10. Click `Create endpoint`.