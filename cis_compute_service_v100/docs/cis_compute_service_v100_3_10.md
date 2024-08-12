## Description

Access logging provides detailed records for the requests that are made to this bucket. This information can include the request type, the resources that are specified in the request, and the time and date that the request was processed. Access logs are useful for many applications.

Access log information is useful in security and access audits.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select `Storage`.
5. All Lightsail buckets are listed here.
6. Click on a bucket name.
7. Click `Logging`.
8. Click on the X next to `Access logging is inactive`.
9. Select a different bucket specific to store the logging information.
10. Note the path or create a path that matches your organization style.
11. Click `save`.
12. Click `OK`.
13. Repeat steps 6-12 for all Lightsail buckets.