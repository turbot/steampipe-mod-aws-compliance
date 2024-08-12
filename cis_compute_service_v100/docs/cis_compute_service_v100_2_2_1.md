## Description

Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service. While disabled by default, forcing encryption at EBS volume creation is supported.

Encrypting data at rest reduces the likelihood that it is unintentionally exposed and can nullify the impact of disclosure if the encryption remains unbroken.

## Remediation

### From Console:

1. Login to the EC2 console using https://console.aws.amazon.com/ec2/.
2. Under `Account attributes`, click `EBS encryption`.
3. Click `Manage`.
4. Click the `Enable` checkbox.
5. Click `Update EBS encryption`.
6. Repeat for every region requiring the change.

**Note** EBS volume encryption is configured per region.

### From Command Line:

1. Run

```bash
aws --region <region> ec2 enable-ebs-encryption-by-default
```

2. Verify that `"EbsEncryptionByDefault": true` is displayed.
3. Repeat every region requiring the change.

**Note** EBS volume encryption is configured per region.