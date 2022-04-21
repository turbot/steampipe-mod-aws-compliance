## Description

This control checks whether an Amazon ECR repository has at least one lifecycle policy configured. This control fails if an ECR repository does not have any lifecycle policies configured.

Amazon ECR lifecycle policies enable you to specify the lifecycle management of images in a repository. By configuring lifecycle policies, you can automate the cleanup of unused images and the expiration of images based on age or count. Automating these tasks can help you avoid unintentionally using outdated images in your repository.

## Remediation

To configure a lifecycle policy, see [Creating a lifecycle policy preview](https://docs.aws.amazon.com/AmazonECR/latest/userguide/lpp_creation.html) in the Amazon Elastic Container Registry User Guide.