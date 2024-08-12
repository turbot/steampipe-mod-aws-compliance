## Description

The simplest way to use HTTPS with an Elastic Beanstalk environment is to assign a server certificate to your environment's load balancer.

When you configure your load balancer to terminate HTTPS, the connection between the client and the load balancer is secure.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com/elasticbeanstalk.
2. On the left hand side click `Environments`.
3. Click on the `Environment name` that you want to review.
4. Under the "environment_name-env" in the left column click `Configuration`.
5. Scroll down under Configurations.
6. Under category look for `Load balancer`.
7. Click `Edit`.
8. Under the `Listeners` section.
9. Click `Add listener`.

```
Set listener port
Set Listener protocol to HTTPS
Set Instance Port
Sent Instance protocol to HTTPS
Select your SSL certificate
```

10. Click `Add`.
11. Make sure it is listed as enabled. If you have other listeners not using HTTPS make sure to turn off enabled.
12. Click `Apply` to save the configuration changes.
13. Repeat steps 3-12 for each environment within the current region.
14. Then repeat the remediation for all other regions.