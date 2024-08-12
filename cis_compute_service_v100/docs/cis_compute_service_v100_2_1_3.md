## Description

Ensure that all base AMIs utilized are approved for use by your organization.

An approved AMI is a base EC2 machine image that is a pre-configured OS configured to run your application. Using approved AMIs helps enforce consistency and security.

## Remediation

Perform the following to remove unauthorized AMIs.

### From Console:

1. Login to the EC2 console at https://console.aws.amazon.com/ec2/.
2. In the left pane click on `Images`.
3. Then choose `AMIs`,
4. Confirm that `Owned by me` is selected.
5. Review the list of AMIs.
6. Confirm that the AMIs listed are all approved for use.
7. If an AMI is listed that is not approved select it.
8. Click on `Actions` and choose `Deregister`.

After all unauthorized AMIs have been De-registered review all EC2 instances.

1. Click on `Instances`.
2. Then choose `Instances`.
3. Select the `EC2 instance` for review.
4. In the `Details` tab review:

```bash
AMI Name
AMI location
```

5. If this information is listed as not available this instance was built with an unauthorized AMI.
6. Follow organization steps to secure this instance and replace it with an instance built from an approved AMI if applicable.
7. Repeat steps 3 – 6 to verify all instance have been created with approved AMIs.

Repeat the process for all other regions.