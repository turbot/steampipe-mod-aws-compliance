## Description

This control checks whether root access is turned on for an Amazon SageMaker notebook instance. The control fails if root access is turned on for a SageMaker notebook instance.

In adherence to the principal of least privilege, it is a recommended security best practice to restrict root access to instance resources to avoid unintentionally over provisioning permissions.

## Remediation

To restrict root access to SageMaker notebook instances, see [Control root access to a SageMaker notebook instance](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-root-access.html) in the Amazon SageMaker Developer Guide.