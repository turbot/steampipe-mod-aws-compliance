## Description

This control checks whether Amazon EFS access points are configured to enforce a user identity. This control fails if a POSIX user identity is not defined while creating the EFS access point.

Amazon EFS access points are application-specific entry points into an EFS file system that make it easier to manage application access to shared datasets. Access points can enforce a user identity, including the user's POSIX groups, for all file system requests that are made through the access point. Access points can also enforce a different root directory for the file system so that clients can only access data in the specified directory or its subdirectories.

## Remediation

To enforce a user identity for an Amazon EFS access point, see [Enforcing a user identity using an access point](https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html#enforce-identity-access-points) in the Amazon Elastic File System User Guide.