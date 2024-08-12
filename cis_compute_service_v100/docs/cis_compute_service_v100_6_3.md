## Description

When you enable load balancing, your AWS Elastic Beanstalk environment is equipped with an Elastic Load Balancing load balancer to distribute traffic among the instances in your environment

For security reasons it is important to have a record of all the access logs and this is enabled within the Load Balancer assigned to the Elastic Beanstalk environments.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com/ec2.
2. On the left hand scroll down to Load Balancing and click on `Load Balancers`.
3. Click on the Load balancer associated with the Elastic Beanstalk Environment.
4. Under the `Description` tab scroll down to the `Attributes` section.
5. Under Access logs - Disabled click on Configure access logs.
6. Click the check box next to `Enable access logs`.
7. enter the se bucket name you have setup for the Elastic Beanstalk access logs.
**Note** - if you don't have a s3 bucket already created enter an organization name in accordance with policy and have it identify with Elastic Beanstalk. Then click the check box next to `Create this location for me`.
8. Click `Save`.
9. Scroll down under the description tab and confirm that the Access logs are set as described above.
10. Repeat steps 3-11 for each Load balancer created and used with Elastic Beanstalk environment within the current region.
11. Then repeat the remediation process for all other regions identified in the Audit.