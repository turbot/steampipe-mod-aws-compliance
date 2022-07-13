## Description

This control checks if Amazon ECS task definitions are configured to share a host’s process namespace with its containers. The control fails if the task definition shares the host's process namespace with the containers running on it.

A process ID (PID) namespace provides separation between processes. It prevents system processes from being visible, and allows PIDs to be reused, including PID 1. If the host’s PID namespace is shared with containers, it would allow containers to see all of the processes on the host system. This reduces the benefit of process level isolation between the host and the containers. These circumstances could lead to unauthorized access to processes on the host itself, including the ability to manipulate and terminate them. Customers shouldn’t share the host’s process namespace with containers running on it.

## Remediation

To configure the pidMode on a task definition, see [Task definition parameters](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_definition_pidmode) in the Amazon Elastic Container Service Developer Guide.
