## Description

This control checks if ECS containers are limited to read-only access to mounted root filesystems. This control fails if the ReadonlyRootFilesystem parameter in the container definition of ECS task definitions is set to false.

Enabling this option reduces security attack vectors since the container instance’s filesystem cannot be tampered with or written to unless it has explicit read-write permissions on its filesystem folder and directories. This control also adheres to the principle of least privilege.

## Remediation

**To limit container definitions to read-only access to root filesystems**

1. Open the [Amazon ECS console](https://console.aws.amazon.com/ecs/).
2. In the left navigation pane, choose `Task Definitions`.
3. For each task definition that has container definitions that need to be updated, do the following:
    - Select the container definition that needs to be updated.
    - Choose `Edit Container`. For `Storage and Logging`, select `Read only root file system`.
    - Choose `Update` at the bottom of the `Edit Container` tab.
    - Choose `Create`.