## Description

Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service.

Encrypting data at rest reduces the likelihood that it is unintentionally exposed and can
nullify the impact of disclosure if the encryption remains unbroken.

## Remediation

### From Console:

1. Login to the EC2 console using https://console.aws.amazon.com/ec2/.
2. Under `Elastic Block Store, click` Snapshots`.
3. Select the snapshot you want to encrypt.
4. Click on `Actions` select `Copy`.

```bash
Confirm `Snapshot ID`
Set the `Destination Region`
Update the `Description`
Select the check box for `Encryption`
```

5. Check the box for `Encrypt this snapshot`.
6. Set the `Master Key`.
7. Click on `Copy`.
8. Repeat steps 3-7 for the snapshots that need to be encrypted.
9. Delete any of the unencrypted snapshots that are not longer needed.

**Note** EBS snapshot volume encryption is configured per snapshot.

### From Command Line:

Using the snapshot ids gathered from the Audit section

1. Run - copy-snapshot.

```bash
aws ec2 copy-snapshot --source-region <region> --source-snapshot-id <snap-
id> --description "Name of the new snapshot" --encrypted
```

2. This will copy the existing unencrypted snapshot and set it to encrypted The output will show the new SnapshotId.
3. Run - describe-snapshot.

```bash
aws ec2 describe-snapshots --owner-ids <account id> --filter
Name=status,Values=completed --query "Snapshots[*].{ID:SnapshotId}"
```

Once the new Snapshot shows in the list confirm encryption is set

4. Run - describe-snapshots

```bash
aws ec2 describe-snapshots --snapshot-id <snap-name> --query
"Snapshots[*].{Encrypt:Encrypted}"
```

5. Repeat steps 1-4 for the snapshots that need to be encrypted.

Delete snapshots that are no longer needed.

6. Run - delete-snapshot

```bash
aws ec2 delete-snapshot --snapshot-id <snap-name>
```

7. Repeat for all unencrypted snapshots that have been copied and encrypted.

**Note**: EBS snapshot volume encryption is configured per snapshot.