## Description

This control checks if an AWS CodeBuild project environment has privileged mode enabled. This control fails when an AWS CodeBuild project environment has privileged mode enabled.

By default, Docker containers do not allow access to any devices. Privileged mode grants a build project's Docker container access to all devices. Setting privilegedMode with value true enables running the Docker daemon inside a Docker container. The Docker daemon listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. This parameter should only be set to true if the build project is used to build Docker images. Otherwise, this setting should be disabled to prevent unintended access to Docker APIs as well as the container’s underlying hardware as unintended access to privilegedMode may risk malicious tampering or deletion of critical resources.

## Remediation

For more information on how to configure CodeBuild project environment settings, see [Create a build project (console)](https://docs.aws.amazon.com/codebuild/latest/userguide/create-project-console.html#create-project-console-environment)in the CodeBuild User Guide