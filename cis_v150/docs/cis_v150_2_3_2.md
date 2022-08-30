## Description

Ensure that RDS database instances have the Auto Minor Version Upgrade flag enabled in order to receive automatically minor engine upgrades during the specified maintenance window. So, RDS instances can get the new features, bug fixes, and security patches for their database engines.

AWS RDS will occasionally deprecate minor engine versions and provide new ones for an upgrade. When the last version number within the release is replaced, the version changed is considered minor. With Auto Minor Version Upgrade feature enabled, the version upgrades will occur automatically during the specified maintenance window so your RDS instances can get the new features, bug fixes, and security patches for their database engines.

## Remediation

### From Console

1. Log in to the AWS management console and navigate to the RDS dashboard at https://console.aws.amazon.com/rds/.
2. In the left navigation panel, click on **Databases**.
3. Select the RDS instance that wants to update.
4. Click on the **Modify** button placed on the top right side.
5. On the **Modify DB Instance: instance identifier** page, In the **Maintenance** section, select **Auto minor version upgrade** click on the **Yes** radio button.
6. At the bottom of the page click on **Continue**, check to Apply Immediately to apply the changes immediately, or select **Apply during the next scheduled maintenance window** to avoid any downtime.
7. Review the changes and click on **Modify DB Instance**. The instance status should change from available to modifying and back to available. Once the feature is enabled, the **Auto Minor Version Upgrade** status should change to Yes.

### From Command Line

1. Run **describe-db-instances** command to list all RDS database instance names, available in the selected AWS region:

```bash
aws rds describe-db-instances --region <regionName> --query 'DBInstances[*].DBInstanceIdentifier'
```

2. The command output should return each database instance identifier.
3. Run the **modify-db-instance** command to modify the selected RDS instance configuration this command will apply the changes immediately, Remove **--apply-immediately** to apply changes during the next scheduled maintenance window and avoid any downtime:

```bash
aws rds modify-db-instance --region <regionName> --db-instance-identifier <dbInstanceIdentifier> --auto-minor-version-upgrade --apply-immediately
```

4. The command output should reveal the new configuration metadata for the RDS instance and check **AutoMinorVersionUpgrade** parameter value.
5. Run **describe-db-instances** command to check if the Auto Minor Version Upgrade feature has been successfully enable:

```bash
aws rds describe-db-instances --region <regionName> --db-instance-identifier <dbInstanceIdentifier> --query 'DBInstances[*].AutoMinorVersionUpgrade'
```

6. The command output should return the feature current status set to **true**, the feature is **enabled** and the minor engine upgrades will be applied to the selected RDS instance.
