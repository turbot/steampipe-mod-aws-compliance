## Description

This control checks whether an Amazon Aurora MySQL DB cluster has audit logging enabled. The control fails if the DB parameter group associated with the DB cluster is not in sync, the server_audit_logging parameter is not set to 1, or the server_audit_events parameter is set to an empty value.

Database logs can assist with security and access audits and help diagnose availability issues. Audit logs capture a record of database activity, including login attempts, data modifications, schema changes, and other events that can be audited for security and compliance purposes.

## Remediation

For information about enabling logging for an Amazon Aurora MySQL DB cluster, see [Publishing Amazon Aurora MySQL logs to Amazon CloudWatch Logs](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Integrating.CloudWatch.html) in the Amazon Aurora User Guide.
