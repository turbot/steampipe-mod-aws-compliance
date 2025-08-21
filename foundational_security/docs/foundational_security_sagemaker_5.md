## Description

This control checks whether an Amazon SageMaker AI hosted model has network isolation enabled. The control fails if the EnableNetworkIsolation parameter for the hosted model is set to False.

SageMaker AI training and deployed inference containers are internet-enabled by default. If you don't want SageMaker AI to provide external network access to your training or inference containers, you can enable network isolation. If you enable network isolation, no inbound or outbound network calls can be made to or from the model container, including calls to or from other AWS services. Additionally, no AWS credentials are made available to the container runtime environment. Enabling network isolation helps prevent unintended access to your SageMaker AI resources from the internet.

## Remediation

For more information about network isolation for SageMaker AI models, see [Run training and inference containers in internet-free mode](https://docs.aws.amazon.com/sagemaker/latest/dg/mkt-algo-model-internet-free.html) in the Amazon SageMaker AI Developer Guide. When you create a model, you can enable network isolation by setting the value for the EnableNetworkIsolation parameter to True.