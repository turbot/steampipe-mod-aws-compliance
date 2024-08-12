## Description

This rule ensures that Amazon Elastic Block Store volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances are marked for deletion when an instance is terminated. If an Amazon EBS volume isn’t deleted when the instance that it’s attached to is terminated, it may violate the concept of least functionality.

## Remediation

### From the Console:

1. At this time the `delete on termination` setting for existing instances can only be changed using AWS CLI.

### From the CLI:

1. Run the modify-instance-attribute command using the list of instances collected in the audit.

```bash
aws ec2 modify-instance-attribute --instance-id i-123456abcdefghi0 --block-
device-mappings "[{\"DeviceName\":

\"/dev/sda\",\"Ebs\":{\"DeleteOnTermination\":true}}]"
```

2. Repeat steps no. 1 with the other instances discovered in all `AWS regions`.

**Note** - If you get any errors running the modify-instance-attribute command confirm
the instance id and the Device Name for that instance is correct. The above command
is referencing the typical default device name.