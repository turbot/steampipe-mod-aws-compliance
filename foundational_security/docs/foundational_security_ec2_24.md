## Description

This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual.

Linux Amazon Machine Images (AMIs) use one of two types of virtualization: paravirtual (PV) or hardware virtual machine (HVM). The main differences between PV and HVM AMIs are the way in which they boot and whether they can take advantage of special hardware extensions (CPU, network, and storage) for better performance.

Historically, PV guests had better performance than HVM guests in many cases, but because of enhancements in HVM virtualization and the availability of PV drivers for HVM AMIs, this is no longer true. For more information, see Linux AMI virtualization types in the Amazon EC2 User Guide for Linux Instances.

## Remediation

For information about how to update an EC2 instance to a new instance type, see [Change the instance type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html) in the Amazon EC2 User Guide for Linux Instances.