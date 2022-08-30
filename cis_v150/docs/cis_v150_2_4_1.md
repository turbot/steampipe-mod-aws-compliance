## Description

EFS data should be encrypted at rest using AWS KMS (Key Management Service).

Data should be encrypted at rest to reduce the risk of a data breach via direct access to the storage device.

## Remediation

It is important to note that EFS file system data at rest encryption must be turned on when creating the file system.
If an EFS file system has been created without data at rest encryption enabled then you must create another EFS file system with the correct configuration and transfer the data.

Steps to create an EFS file system with data encrypted at rest:

### From Console

1. Login to the AWS Management Console and Navigate to **Elastic File System (EFS) dashboard**.
2. Select **File Systems** from the left navigation panel.
3. Click **Create File System** button from the dashboard top menu to start the file system setup process.
4. On the **Configure file system access** configuration page, perform the following actions.
   * Choose the right VPC from the VPC dropdown list.
   * Within Create mount targets section, select the checkboxes for all of the Availability Zones (AZs) within the selected VPC. These will be your mount targets.
   * Click **Next step** to continue.
5. Perform the following on the **Configure optional settings** page.
   * Create **tags** to describe your new file system.
   * Choose **performance mode** based on your requirements.
   * Check **Enable encryption** checkbox and choose **aws/elasticfilesystem** from Select KMS master key dropdown list to enable encryption for the new file system using the default master key provided and managed by AWS KMS.
   * Click **Next step** to continue.
6. Review the file system configuration details on the **review and create** page and then click **Create File System** to create your new AWS EFS file system.
7. Copy the data from the old unencrypted EFS file system onto the newly create encrypted file system.
8. Remove the unencrypted file system as soon as your data migration to the newly create encrypted file system is completed.
9. Change the AWS region from the navigation bar and repeat the entire process for other aws regions.


### From Command Line

1. Run describe-file-systems command to describe the configuration information available for the selected (unencrypted) file system (see Audit section to identify the right resource):

```bash
aws efs describe-file-systems --region <region> --file-system-id <filesystem-id from audit section step 2 output>
```

2. The command output should return the requested configuration information.
3. To provision a new AWS EFS file system, you need to generate a universally unique identifier (UUID) in order to create the token required by the create-filesystem command. To create the required token, you can use a randomly generated UUID from "https://www.uuidgenerator.net".
4. Run create-file-system command using the unique token created at the previous step

```bash
aws efs create-file-system --region <region> --creation-token <Token (randomly generated UUID from step 3)> --performance-mode generalPurpose --encrypted
```

5. The command output should return the new file system configuration metadata.
6. Run create-mount-target command using the newly created EFS file system ID returned at the previous step as identifier and the ID of the Availability Zone (AZ) that will represent the mount target:

```bash
aws efs create-mount-target --region <region> --file-system-id <file-systemid> --subnet-id <subnet-id>
```

7. The command output should return the new mount target metadata.
8. Now you can mount your file system from an EC2 instance.
9. Copy the data from the old unencrypted EFS file system onto the newly create encrypted file system.
10. Remove the unencrypted file system as soon as your data migration to the newly create encrypted file system is completed.

```bash
aws efs delete-file-system --region <region> --file-system-id <unencryptedfile-system-id>
```

11. Change the AWS region by updating the --region and repeat the entire process for other aws regions.
