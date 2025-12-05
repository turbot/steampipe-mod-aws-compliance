## Description

This control checks whether an Amazon EC2 launch template enables encryption for all attached EBS volumes. The control fails if the encryption parameter is set to False for any EBS volumes specified by the EC2 launch template.

Amazon EBS encryption is a straightforward encryption solution for EBS resources that are associated with Amazon EC2 instances. With EBS encryption, you aren't required to build, maintain, and secure your own key management infrastructure. EBS encryption uses AWS KMS keys when creating encrypted volumes and snapshots. Encryption operations occur on the servers that host EC2 instances, which helps ensure the security of data at rest and data in transit between an EC2 instance and its attached EBS storage. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption.html) in the Amazon EBS User Guide.

You can enable EBS encryption during manual launches of individual EC2 instances. However, there are several benefits to using EC2 launch templates and configuring encryption settings in those templates. You can enforce encryption as a standard and ensure the use of consistent encryption settings. You can also reduce the risk of error and security gaps that might occur with manual launches of instances.

## Remediation

After you create an Amazon EC2 launch template, you can't modify it. However, you can create a new version of a launch template and change the encryption settings in that new version of the template. You can also specify the new version as the default version of the launch template. Then, if you launch an EC2 instance from a launch template and don't specify a template version, EC2 uses the settings of the default version when it launches the instance. For more information, see [Modify a launch template](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/manage-launch-template-versions.html) in the Amazon EC2 User Guide.