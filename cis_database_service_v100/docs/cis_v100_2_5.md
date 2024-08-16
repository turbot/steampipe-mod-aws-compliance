## Description

AWS Identity and Access Management (IAM) helps manage access to AWS resources. While you cannot directly associate IAM roles with Amazon Aurora instances, you can use IAM roles and policies to define which AWS IAM users and groups have management permissions for Amazon RDS resources and what actions they can perform.Here is a guide:

Individual creates IAM roles and polices that define specific permission given to that role. This determines what the identity or instance can and cannot do.
