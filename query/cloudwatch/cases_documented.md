
# Control Result

```
+------------------------+--------+----------------------------------------------------------------------+--------------+
| resource        | status | reason                                | account_id  |
+------------------------+--------+----------------------------------------------------------------------+--------------+
| arn:aws:::123456782528 | alarm | No log metric filter and alarm exists for AWS Organizations changes. | 123456782528 |
| arn:aws:::123456782495 | alarm | No log metric filter and alarm exists for AWS Organizations changes. | 123456782495 |
+------------------------+--------+----------------------------------------------------------------------+--------------+
```

# Query Result

The queries **with** and **without** quotes are attached below along with the output :

## Case 1: Our existing query with ""
query :
```sql
select * from aws_cloudwatch_log_metric_filter where filter_pattern ~ '\s*\$\.eventSource\s*=\s*organizations.amazonaws.com.+\$\.eventName\s*=\s*"AcceptHandshake".+\$\.eventName\s*=\s*"AttachPolicy".+\$\.eventName\s*=\s*"CreateAccount".+\$\.eventName\s*=\s*"CreateOrganizationalUnit".+\$\.eventName\s*=\s*"CreatePolicy".+\$\.eventName\s*=\s*"DeclineHandshake".+\$\.eventName\s*=\s*"DeleteOrganization".+\$\.eventName\s*=\s*"DeleteOrganizationalUnit".+\$\.eventName\s*=\s*"DeletePolicy".+\$\.eventName\s*=\s*"DetachPolicy".+\$\.eventName\s*=\s*"DisablePolicyType".+\$\.eventName\s*=\s*"EnablePolicyType".+\$\.eventName\s*=\s*"InviteAccountToOrganization".+\$\.eventName\s*=\s*"LeaveOrganization".+\$\.eventName\s*=\s*"MoveAccount".+\$\.eventName\s*=\s*"RemoveAccountFromOrganization".+\$\.eventName\s*=\s*"UpdatePolicy".+\$\.eventName\s*=\s*"UpdateOrganizationalUnit"'
```

Output : Returns 4 rows
```sql
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
| name                                                                           | log_group_name        | creation_time             | filter_pattern
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
| 4.15 Ensure a log metric filter and alarm exists for AWS Organizations changes | cis-revalidate-loggrp | 2021-09-24T18:31:48+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| cis-section-4.15                                                               | raj-test-cis-4.2      | 2021-03-16T21:51:46+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| organizations_changes                                                          | cis-revalidate-loggrp | 2021-09-24T14:16:48+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| sp-filter-test                                                                 | sp-test-log-grp-test  | 2023-02-17T17:12:51+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
```

## Case 2 : Without  ""

query :

```sql
select * from aws_cloudwatch_log_metric_filter where filter_pattern ~ '\s*\$\.eventSource\s*=\s*organizations.amazonaws.com.+\$\.eventName\s*=\s*AcceptHandshake.+\$\.eventName\s*=\s*AttachPolicy.+\$\.eventName\s*=\s*CreateAccount.+\$\.eventName\s*=\s*CreateOrganizationalUnit.+\$\.eventName\s*=\s*CreatePolicy.+\$\.eventName\s*=\s*DeclineHandshake.+\$\.eventName\s*=\s*DeleteOrganization.+\$\.eventName\s*=\s*DeleteOrganizationalUnit.+\$\.eventName\s*=\s*DeletePolicy.+\$\.eventName\s*=\s*DetachPolicy.+\$\.eventName\s*=\s*DisablePolicyType.+\$\.eventName\s*=\s*EnablePolicyType.+\$\.eventName\s*=\s*InviteAccountToOrganization.+\$\.eventName\s*=\s*LeaveOrganization.+\$\.eventName\s*=\s*MoveAccount.+\$\.eventName\s*=\s*RemoveAccountFromOrganization.+\$\.eventName\s*=\s*UpdatePolicy.+\$\.eventName\s*=\s*UpdateOrganizationalUnit'
```

Output :  Returns 1 rows

```sql
+------------+------------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------
| name       | log_group_name   | creation_time             | filter_pattern
+------------+------------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------
| cis4.15-ex | raj-test-cis-4.2 | 2021-05-06T13:28:33+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CreateAccount) |
+------------+------------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------
```

### Case 3 : As suggested in the PR by @marinalimeira

query :
```sql
select * from aws_cloudwatch_log_metric_filter where filter_pattern ~ '\s*\$\.eventSource\s*=\s*organizations.amazonaws.com.+\$\.eventName\s*=\s*"?AcceptHandshake"?.+\$\.eventName\s*=\s*"?AttachPolicy"?.+\$\.eventName\s*=\s*"?CreateAccount"?.+\$\.eventName\s*=\s*"?CreateOrganizationalUnit"?.+\$\.eventName\s*=\s*"?CreatePolicy"?.+\$\.eventName\s*=\s*"?DeclineHandshake"?.+\$\.eventName\s*=\s*"?DeleteOrganization"?.+\$\.eventName\s*=\s*"?DeleteOrganizationalUnit"?.+\$\.eventName\s*=\s*"?DeletePolicy"?.+\$\.eventName\s*=\s*"?DetachPolicy"?.+\$\.eventName\s*=\s*"?DisablePolicyType"?.+\$\.eventName\s*=\s*"?EnablePolicyType"?.+\$\.eventName\s*=\s*"?InviteAccountToOrganization"?.+\$\.eventName\s*=\s*"?LeaveOrganization"?.+\$\.eventName\s*=\s*"?MoveAccount"?.+\$\.eventName\s*=\s*"?RemoveAccountFromOrganization"?.+\$\.eventName\s*=\s*"?UpdatePolicy"?.+\$\.eventName\s*=\s*"?UpdateOrganizationalUnit"?'
```

Output : It gives 5 results
```sql
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
| name                                                                           | log_group_name        | creation_time             | filter_pattern
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
| 4.15 Ensure a log metric filter and alarm exists for AWS Organizations changes | cis-revalidate-loggrp | 2021-09-24T18:31:48+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| cis-section-4.15                                                               | raj-test-cis-4.2      | 2021-03-16T21:51:46+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| **cis4.15-ex**                                                                   | raj-test-cis-4.2      | 2021-05-06T13:28:33+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = AcceptHand
| organizations_changes                                                          | cis-revalidate-loggrp | 2021-09-24T14:16:48+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
| sp-filter-test                                                                 | sp-test-log-grp-test  | 2023-02-17T17:12:51+05:30 | { ($.eventSource = organizations.amazonaws.com) && (($.eventName = "AcceptHan
+--------------------------------------------------------------------------------+-----------------------+---------------------------+------------------------------------------------------------------------------
```

## What is extra over here is

**cis4.15-ex**
which has a filter_pattern as below

```
{ ($.eventSource = organizations.amazonaws.com) && (($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CreateAccount) || ($.eventName = CreateOrganizationalUnit) || ($.eventName = CreatePolicy) || ($.eventName = DeclineHandshake) || ($.eventName = DeleteOrganization) || ($.eventName = DeleteOrganizationalUnit) || ($.eventName = DeletePolicy) || ($.eventName = DetachPolicy) || ($.eventName = DisablePolicyType) || ($.eventName = EnablePolicyType) || ($.eventName = InviteAccountToOrganization) || ($.eventName = LeaveOrganization) || ($.eventName = MoveAccount) || ($.eventName = RemoveAccountFromOrganization) || ($.eventName = UpdatePolicy) || ($.eventName = UpdateOrganizationalUnit)) }
```

here
`$.eventName = AcceptHandshake` is different from other pattern like `$.eventName = \"AcceptHandshake\"` and so this was not coming in our previous query

## case 4 : Prowler provided pattern

```sql
select * from aws_cloudwatch_log_metric_filter where filter_pattern ~ '\$\.eventSource\s*=\s*organizations\.amazonaws\.com.+\$\.eventName\s*=\s*AcceptHandshake.+\$\.eventName\s*=\s*AttachPolicy.+\$\.eventName\s*=\s*CancelHandshake.+\$\.eventName\s*=\s*CreateAccount.+\$\.eventName\s*=\s*CreateOrganization.+\$\.eventName\s*=\s*CreateOrganizationalUnit.+\$\.eventName\s*=\s*CreatePolicy.+\$\.eventName\s*=\s*DeclineHandshake.+\$\.eventName\s*=\s*DeleteOrganization.+\$\.eventName\s*=\s*DeleteOrganizationalUnit.+\$\.eventName\s*=\s*DeletePolicy.+\$\.eventName\s*=\s*EnableAllFeatures.+\$\.eventName\s*=\s*EnablePolicyType.+\$\.eventName\s*=\s*InviteAccountToOrganization.+\$\.eventName\s*=\s*LeaveOrganization.+\$\.eventName\s*=\s*DetachPolicy.+\$\.eventName\s*=\s*DisablePolicyType.+\$\.eventName\s*=\s*MoveAccount.+\$\.eventName\s*=\s*RemoveAccountFromOrganization.+\$\.eventName\s*=\s*UpdateOrganizationalUnit.+\$\.eventName\s*=\s*UpdatePolicy'
```

Output : 0 vales

```sql

+------+----------------+---------------+----------------+----------------------------+---------------------------------+-----------------------------+-------+------+-----------+--------+------------+------+
| name | log_group_name | creation_time | filter_pattern | metric_transformation_name | metric_transformation_namespace | metric_transformation_value | title | akas | partition | region | account_id | _ctx |
+------+----------------+---------------+----------------+----------------------------+---------------------------------+-----------------------------+-------+------+-----------+--------+------------+------+
+------+----------------+---------------+----------------+----------------------------+---------------------------------+-----------------------------+-------+------+-----------+--------+------------+-----
```