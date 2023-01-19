## Description

AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access. "AWS Access" means accessing the APIs of AWS in order to access AWS resources or manage AWS account resources.

AWS IAM roles reduce the risks associated with sharing and rotating credentials that can be used outside of AWS itself. If credentials are compromised, they can be used from outside of the AWS account they give access to. In contrast, in order to leverage role permissions an attacker would need to gain and maintain access to a specific instance to use the privileges associated with it.

Additionally, if credentials are encoded into compiled applications or other hard to change mechanisms, then they are even more unlikely to be properly rotated due to service disruption risks. As time goes on, credentials that cannot be rotated are more likely to be known by an increasing number of individuals who no longer work for the organization owning the credentials.

## Remediation

IAM roles can only be associated at the launch of an instance. To remediate an instance to add it to a role you must create a new instance.
If the instance has no external dependencies on its current private ip or public addresses are elastic IPs:

1. In AWS IAM create a new role. Assign a permissions policy if needed permissions are already known.
2. In the AWS console launch a new instance with identical settings to the existing instance, and ensure that the newly created role is selected.
3. Shutdown both the existing instance and the new instance.
4. Detach disks from both instances.
5. Attach the existing instance disks to the new instance.
6. Boot the new instance and you should have the same machine, but with the associated role.

**Note**: If your environment has dependencies on a dynamically assigned PRIVATE IP address you can create an AMI from the existing instance, destroy the old one and then when launching from the AMI, manually assign the previous private IP address.

**Note**: If your environment has dependencies on a dynamically assigned PUBLIC IP address there is not a way ensure the address is retained and assign an instance role. Dependencies on dynamically assigned public IP addresses are a bad practice and, if possible, you may wish to rebuild the instance with a new elastic IP address and make the investment to remediate affected systems while assigning the system to a role.
