## Description

This control checks if Amazon EFS access points are configured to enforce a root directory. The control fails if the value of Path is set to / (the default root directory of the file system).

When you enforce a root directory, the NFS client using the access point uses the root directory configured on the access point instead of the file system's root directory. Enforcing a root directory for an access point helps restrict data access by ensuring that users of the access point can only reach files of the specified subdirectory.

## Remediation

For instructions on how to enforce a root directory for an Amazon EFS access point, see [Enforcing a root directory with an access point](https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html#enforce-root-directory-access-point) in the Amazon Elastic File System User Guide.