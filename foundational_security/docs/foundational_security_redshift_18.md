## Description

This control checks whether multiple Availability Zones (Multi-AZ) deployments are enabled for an Amazon Redshift cluster. The control fails if Multi-AZ deployments aren't enabled for the Amazon Redshift cluster.

Amazon Redshift supports multiple Availability Zones (Multi-AZ) deployments for provisioned clusters. If Multi-AZ deployments are enabled for a cluster, an Amazon Redshift data warehouse can continue operating in failure scenarios when an unexpected event happens in an Availability Zone (AZ). A Multi-AZ deployment deploys compute resources in more than one AZ and these compute resources can be accessed through a single endpoint. In the event of an entire AZ failure, the remaining compute resources in another AZ are available to continue processing workloads. You can convert an existing Single-AZ data warehouse to a Multi-AZ data warehouse. Additional compute resources are then provisioned in a second AZ.

## Remediation

For information about configuring Multi-AZ deployments for an Amazon Redshift cluster, see [Converting a Single-AZ data warehouse to a Multi-AZ data warehouse](https://docs.aws.amazon.com/redshift/latest/mgmt/convert-saz-to-maz.html) in the Amazon Redshift Management Guide.