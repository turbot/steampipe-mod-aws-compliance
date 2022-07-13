## Description

This control checks if Amazon ECS Fargate services are running the latest Fargate platform version. This control fails if the platform version is not the latest.

AWS Fargate platform versions refer to a specific runtime environment for Fargate task infrastructure, which is a combination of kernel and container runtime versions. New platform versions are released as the runtime environment evolves. For example, a new version may be released for kernel or operating system updates, new features, bug fixes, or security updates. Security updates and patches are deployed automatically for your Fargate tasks. If a security issue is found that affects a platform version, AWS patches the platform version.

## Remediation

To update an existing service, including its platform version, see [Updating a service](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/update-service.html) in the Amazon Elastic Container Service Developer Guide.