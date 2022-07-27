## Description

This control checks whether a private ECR repository has image scanning configured. This control fails if a private ECR repository doesn't have image scanning configured.

ECR image scanning helps in identifying software vulnerabilities in your container images. ECR uses the Common Vulnerabilities and Exposures (CVEs) database from the open-source Clair project  and provides a list of scan findings. Enabling image scanning on ECR repositories adds a layer of verification for the integrity and safety of the images being stored.

## Remediation

To configure image scanning for an ECR repository, see [Image scanning](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html) in the Amazon Elastic Container Registry User Guide.
