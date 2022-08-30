## Description

Ensure and verify that RDS database instances provisioned in your AWS account do restrict unauthorized access in order to minimize security risks. To restrict access to any publicly accessible RDS database instance, you must disable the database Publicly Accessible flag and update the VPC security group associated with the instance.

Ensure that no public-facing RDS database instances are provisioned in your AWS account and restrict unauthorized access in order to minimize security risks. When the RDS instance allows unrestricted access (0.0.0.0/0), everyone and everything on the Internet can establish a connection to your database and this can increase the opportunity for malicious activities such as brute force attacks, PostgreSQL injections, or DoS/DDoS attacks.

## Remediation

### From Console

1. Log in to the AWS management console and navigate to the RDS dashboard at https://console.aws.amazon.com/rds/.
2. Under the navigation panel, On RDS Dashboard, click **Databases**.
3. Select the RDS instance that you want to update.
4. Click **Modify** from the dashboard top menu.
5. On the Modify DB Instance panel, under the **Connectivity** section, click on **Additional connectivity configuration** and update the value for **Publicly Accessible** to Not publicly accessible to restrict public access. Follow the below steps to update subnet configurations:
   * Select the **Connectivity and security** tab, and click on the VPC attribute value inside the **Networking** section.
   * Select the **Details** tab from the VPC dashboard bottom panel and click on Route table configuration attribute value.
   * On the Route table details page, select the Routes tab from the dashboard bottom panel and click on **Edit routes**.
   * On the Edit routes page, update the Destination of Target which is set to **igw-xxxxx** and click on **Save** routes.
6. On the Modify DB Instance panel Click on **Continue** and In the Scheduling of modifications section, perform one of the following actions based on your requirements:
   * Select Apply during the next scheduled maintenance window to apply the changes automatically during the next scheduled maintenance window.
   * Select Apply immediately to apply the changes right away. With this option, any pending modifications will be asynchronously applied as soon as possible, regardless of the maintenance window setting for this RDS database instance. Note that any changes available in the pending modifications queue are also applied. If any of the pending modifications require downtime, choosing this option can cause unexpected downtime for the application.
7. Repeat steps 3 to 6 for each RDS instance available in the current region.
8. Change the AWS region from the navigation bar to repeat the process for other regions.

### From Command Line

1. Run **describe-db-instances** command to list all RDS database names identifiers, available in the selected AWS region:

```bash
aws rds describe-db-instances --region <region-name> --query 'DBInstances[*].DBInstanceIdentifier'
```

2. The command output should return each database instance identifier.
3. Run **modify-db-instance** command to modify the selected RDS instance configuration. Then use the following command to disable the **Publicly Accessible** flag for the selected RDS instances. This command use the apply-immediately flag. If you want **to avoid any downtime --no-apply-immediately flag can be used:**

```bash
aws rds modify-db-instance --region <region-name> --db-instance-identifier <db-name> --no-publicly-accessible --apply-immediately
```

4. The command output should reveal the **PubliclyAccessible** configuration under pending values and should get applied at the specified time.
5. Updating the Internet Gateway Destination via AWS CLI is not currently supported To update information about Internet Gateway use the AWS Console Procedure.
6. Repeat steps 1 to 5 for each RDS instance provisioned in the current region.
7. Change the AWS region by using the --region filter to repeat the process for other regions.
