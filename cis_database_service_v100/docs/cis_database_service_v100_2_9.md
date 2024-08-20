## Description

Use the principle of least privilege when granting access to your Amazon Aurora resources. This principle of least privilege (POLP) is a computer security concept where users are given the minimum access levels necessary to complete their job functions. In Amazon Aurora, this can be implemented at various levels, including AWS IAM for managing AWS resources and within the database for managing database users and roles. Here is a step-by-step guide for each:

POLP limits the user interaction on the database, and it only gives the database permission to complete the necessary or mandatory task. AWS IAM gives permission for what the entity can and cannot do. Incorporating both POLP and AWS IAM in a database gives limited permission to the user to complete the tasks.

## Remediation

This is important because it reduces and secures any possible threat that an unauthorized user can gain by hacking into the system.