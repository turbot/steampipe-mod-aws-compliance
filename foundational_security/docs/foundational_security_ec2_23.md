## Description

This control checks if EC2 Transit Gateways are automatically accepting shared VPC attachments. This control fails for a Transit Gateway that automatically accepts shared VPC attachment requests.

Turning on AutoAcceptSharedAttachments configures a Transit Gateway to automatically accept any cross-account VPC attachment requests without verifying the request or the account the attachment is originating from. To follow the best practices of authorization and authentication, we recommended turning off this feature to ensure that only authorized VPC attachment requests are accepted.

## Remediation

For information about how to modify a Transit Gateway, see [Modify a transit gateway](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-transit-gateways.html#tgw-modifying) in the Amazon VPC Developer Guide.