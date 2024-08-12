## Description

AWS Elastic Beanstalk regularly releases platform updates to provide fixes, software updates, and new features. With managed platform updates, you can configure your environment to automatically upgrade to the latest version of a platform during a scheduled maintenance window.

Your application remains in service during the update process with no reduction in capacity. Managed updates are available on both single-instance and load-balanced environments. They also ensure you aren't introducing any vulnerabilities by running legacy systems that require updates and patches.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com/elasticbeanstalk.
2. On the left hand side click `Environments`.
3. Click on the `Environment name` that you want to update.
4. Under the environment_name-env in the left column click `Configuration`.
5. Scroll down under Configurations.
6. Under category look for `Managed updates`.
7. Click on `Edit`.
8. On the Managed Platform Updates page.

```
Managed updates - click the Enable checkbox
Weekly update window - set preferred maintenance window
Update level- set it to Minor and patch
Instance replacement - click the Enabled checkbox
```

9. Click `Apply`.
10. Repeat steps 3-8 for each environment within the current region that needs Managed updates set.
11. Then repeat the remediation process for all other regions identified in the Audit.