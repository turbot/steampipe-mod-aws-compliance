## Description

This control checks whether an Amazon CloudFront distribution is configured to use the recommended TLS security policy. The control fails if the CloudFront distribution is not configured to use the recommended TLS security policy.

If you configure an Amazon CloudFront distribution to require viewers to use HTTPS to access content, you have to choose a security policy and specify the minimum SSL/TLS protocol version to use. This determines which protocol version CloudFront uses to communicate with viewers, and the ciphers that CloudFront uses to encrypt the communications. We recommend using the latest security policy that CloudFront provides. This ensures that CloudFront uses the latest cipher suites to encrypt data in transit between a viewer and a CloudFront distribution.

## Remediation

For information about configuring the security policy for a CloudFront distribution, see [Update a distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToUpdateDistribution.html) in the Amazon CloudFront Developer Guide. When you configure the security policy for a distribution, choose the latest security policy.