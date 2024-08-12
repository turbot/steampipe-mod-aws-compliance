## Description

You can make all objects private, public (read-only) or private while making individual objects public (read-only). By default when creating a bucket the permissions are set to "All objects are private".

When the Bucket access permissions are set to All objects are public (read-only) – All objects in the bucket are readable by anyone on the internet through the URL of the bucket.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select `Storage`.
5. All Lightsail buckets are listed here.
6. Click on the bucket name that has `All objects are public (read-Only)` listed.
7. Click on `Permissions`.
8. Click on `Change permissions`.
9. Select `All objects are private`.
10. Click `Save`.
11. Repeat for any other Buckets within Lightsail that are set with `All objects are public (read-Only)` and/or `Individual objects can be made public and read only`.

### From the Command Line:

1. Run `aws lightsail update-bucket`

```
aws lightsail update-bucket --bucket-name <name from list in audit> --access-
rules getObject="private",allowPublicOverrides=false
```

2. The confirmation that the change was made will print out after running that command.
3. Repeat for any other buckets listed in the audit.