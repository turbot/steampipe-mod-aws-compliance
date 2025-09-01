## Description

This control checks whether an Amazon SageMaker AI notebook instance is configured to run on a supported platform, based on the platform identifier specified for the notebook instance. The control fails if the notebook instance is configured to run on a platform that's no longer supported.

If the platform for an Amazon SageMaker AI notebook instance is no longer supported, it might not receive security patches, bug fixes, or other types of updates. Notebook instances might continue to function, but they won't receive SageMaker AI security updates or critical bug fixes. You assume the risks associated with using an unsupported platform. For more information, see [JupyterLab versioning](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-jl.html) in the Amazon SageMaker AI Developer Guide.

## Remediation

For information about the platforms that Amazon SageMaker AI currently supports and how to migrate to them, see [Amazon Linux 2 notebook instances](https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-al2.html) in the Amazon SageMaker AI Developer Guide.