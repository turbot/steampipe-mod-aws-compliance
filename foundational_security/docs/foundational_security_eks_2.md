## Description

This control checks whether an Amazon EKS cluster is running on a supported Kubernetes version. The control fails if the EKS cluster is running on an unsupported version.

If your application doesn't require a specific version of Kubernetes, we recommend that you use the latest available Kubernetes version that's supported by EKS for your clusters. For more information about supported Kubernetes versions for Amazon EKS, see [Amazon EKS Kubernetes release calendar](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html#kubernetes-release-calendar) and [Amazon EKS version support and FAQ](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html#version-deprecation)/para> in the Amazon EKS User Guide.

## Remediation

To update an EKS cluster, [Updating an Amazon EKS cluster Kubernetes version](https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html)/para> in the Amazon EKS User Guide.