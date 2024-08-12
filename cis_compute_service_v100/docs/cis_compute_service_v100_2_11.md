## Description

Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization’s standards.

## Remediation

### From the Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane, click `Instances`, click `Instances`.
3. Select the Instance for that hasn't been used for over 90 days.
4. Under the `Details` tab.
5. Click `Instance state`, click `Terminate instance`.
6. Click `Terminate`.
7. Repeat steps no. 3 – 6 the other instances with a launch date equal to or over 90 days.

Repeat all steps for the other regions.
