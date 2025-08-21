## Description

This control checks whether enhanced VPC routing is enabled for an Amazon Redshift Serverless workgroup. The control fails if enhanced VPC routing is disabled for the workgroup.

If enhanced VPC routing is disabled for an Amazon Redshift Serverless workgroup, Amazon Redshift routes traffic through the internet, including traffic to other services within the AWS network. If you enable enhanced VPC routing for a workgroup, Amazon Redshift forces all COPY and UNLOAD traffic between your cluster and your data repositories through your virtual private cloud (VPC) based on the Amazon VPC service. With enhanced VPC routing, you can use standard VPC features to control the flow of data between your Amazon Redshift cluster and other resources. This includes features such as VPC security groups and endpoint policies, network access control lists (ACLs), and Domain Name System (DNS) servers. You can also use VPC flow logs to monitor COPY and UNLOAD traffic.

## Remediation

For more information about enhanced VPC routing and how to enable it for a workgroup, see [Controlling network traffic with Redshift enhanced VPC routing](https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html) in the Amazon Redshift Management Guide.