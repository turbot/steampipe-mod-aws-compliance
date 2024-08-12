## Description

Elastic Beanstalk can be configured to automatically stream logs to the CloudWatch service.

With CloudWatch Logs, you can monitor and archive your Elastic Beanstalk application, system, and custom log files from Amazon EC2 instances of your environments.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com/elasticbeanstalk.
2. On the left hand side click `Environments`.
3. Click on the `Environment name` that you want to update.
4. Under the `environment_name-env` in the left column click `Configuration`.
5. Scroll down under Configurations.
6. Under category look for `Software`.
7. Click on Edit.
8. On the Modify software page.

```
Instance log streaming to CloudWatch Logs
Log streaming - click the Enabled checkbox
Set the required retention based on Organization requirements
Lifecycle - Keep logs after terminating environment
```

9. Click Apply.
10. Repeat steps 3-8 for each environment within the current region that needs Managed updates set.