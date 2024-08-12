## Description

Identify any unused Elastic Block Store (EBS) volumes in your AWS account and remove them.

Any Elastic Block Store volume created in your AWS account contains data, regardless of being used or not. If you have EBS volumes (other than root volumes) that are unattached to an EC2 instance they should be removed to prevent unauthorized access or data leak to any sensitive data on these volumes.

## Remediation

### From Console:

1. Login to the EC2 console using https://console.aws.amazon.com/ec2/.
2. Under `Elastic Block Store`, click `Volumes`.
3. Find the `State` column.
4. Sort by `Available`.
5. Select the Volume that you want to delete.
6. Click `Actions, Delete volume, Yes, Delete`.

**Note**: EBS volumes can be in different regions. Make sure to review all the regions
being utilized.

### From Command Line:

Using the list of `available volumes` identified in the Audit above

1. Run the delete-volume command

```bash
aws ec2 delete-volume --volume-id <vol-name>
```

2. This will delete the volume identified.

**Note**: Using this command will not prompt you for confirmation. It will delete the volume and you will not be able to recover it. Please make sure you have the correct volume and that you have created a snapshot if it is something that needs to be archived.

**Note** : EBS volumes can be in different regions. Make sure to review all the regions being utilized.