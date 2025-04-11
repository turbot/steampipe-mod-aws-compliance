locals {
  cis_compute_service_v100_2_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_compute_service_v100_2_1_common_tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_section_id = "2.1"
  })

  cis_compute_service_v100_2_2_common_tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_section_id = "2.2"
  })
}

benchmark "cis_compute_service_v100_2" {
  title         = "2 Elastic Cloud Compute (EC2)"
  description   = "Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. This section will contain recommendations for configuring your compute resources within EC2."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2.md")
  children = [
    benchmark.cis_compute_service_v100_2_1,
    benchmark.cis_compute_service_v100_2_2,
    control.cis_compute_service_v100_2_3,
    control.cis_compute_service_v100_2_4,
    control.cis_compute_service_v100_2_5,
    control.cis_compute_service_v100_2_6,
    control.cis_compute_service_v100_2_7,
    control.cis_compute_service_v100_2_8,
    control.cis_compute_service_v100_2_9,
    control.cis_compute_service_v100_2_10,
    control.cis_compute_service_v100_2_11,
    control.cis_compute_service_v100_2_12,
    control.cis_compute_service_v100_2_13,
    control.cis_compute_service_v100_2_14
  ]

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_compute_service_v100_2_1" {
  title         = "2.1 Amazon Machine Images (AMI)"
  description   = "This section contains recommendations for the security of Amazon Machine Images (AMI's) that you could utilize within the AWS EC2 Service."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1.md")
  children = [
    control.cis_compute_service_v100_2_1_1,
    control.cis_compute_service_v100_2_1_2,
    control.cis_compute_service_v100_2_1_3,
    control.cis_compute_service_v100_2_1_4,
    control.cis_compute_service_v100_2_1_5
  ]

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_2_1_1" {
  title         = "2.1.1 Ensure Consistent Naming Convention is used for Organizational AMI"
  description   = "The naming convention for AMI (Amazon Machine Images) should be documented and followed for any AMI's created."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1_1.md")

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_1_2" {
  title         = "2.1.2 Ensure Images (AMI's) are encrypted"
  description   = "Amazon Machine Images should utilize EBS Encrypted snapshots"
  query         = query.ec2_ami_ebs_encryption_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1_2.md")

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_1_3" {
  title         = "2.1.3 Ensure Only Approved AMIs (Images) are Used"
  description   = "Ensure that all base AMIs utilized are approved for use by your organization."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1_3.md")

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_1_4" {
  title         = "2.1.4 Ensure Images (AMI) are not older than 90 days"
  description   = "Ensure that your AMIs are not older than 90 days."
  query         = query.ec2_ami_not_older_than_90_days
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1_4.md")

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_1_5" {
  title         = "2.1.5 Ensure Images are not Publicly Available"
  description   = "EC2 allows you to make an AMI public, sharing it with all AWS accounts."
  query         = query.ec2_ami_restrict_public_access
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_1_5.md")

  tags = merge(local.cis_compute_service_v100_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

benchmark "cis_compute_service_v100_2_2" {
  title         = "2.2 Elastic Block Storage (EBS)"
  description   = "This section contains guidance for Amazon Elastic Block Store (EBS) which is a high performance block storage service designed for use with Amazon Elastic Compute Cloud (EC2)."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_2.md")
  children = [
    control.cis_compute_service_v100_2_2_1,
    control.cis_compute_service_v100_2_2_2,
    control.cis_compute_service_v100_2_2_3,
    control.cis_compute_service_v100_2_2_4
  ]

  tags = merge(local.cis_compute_service_v100_2_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_2_2_1" {
  title         = "2.2.1 Ensure EBS volume encryption is enabled"
  description   = "Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service. While disabled by default, forcing encryption at EBS volume creation is supported."
  query         = query.ebs_encryption_by_default_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_2_1.md")

  tags = merge(local.cis_compute_service_v100_2_2_common_tags, {
    cis_item_id = "2.2.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EBS"
  })
}

control "cis_compute_service_v100_2_2_2" {
  title         = "2.2.2 Ensure public access to EBS Snapshots is disabled"
  description   = "To protect your data disable the public mode of EBS snapshots."
  query         = query.ebs_snapshot_not_publicly_restorable
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_2_2.md")

  tags = merge(local.cis_compute_service_v100_2_2_common_tags, {
    cis_item_id = "2.2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EBS"
  })
}

control "cis_compute_service_v100_2_2_3" {
  title         = "2.2.3 Ensure EBS volume snapshots are encrypted"
  description   = "Elastic Compute Cloud (EC2) supports encryption at rest when using the Elastic Block Store (EBS) service."
  query         = query.ebs_snapshot_encryption_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_2_3.md")

  tags = merge(local.cis_compute_service_v100_2_2_common_tags, {
    cis_item_id = "2.2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EBS"
  })
}

control "cis_compute_service_v100_2_2_4" {
  title         = "2.2.4 Ensure unused EBS volumes are removed"
  description   = "Identify any unused Elastic Block Store (EBS) volumes in your AWS account and remove them."
  query         = query.ebs_volume_unused
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_2_4.md")

  tags = merge(local.cis_compute_service_v100_2_2_common_tags, {
    cis_item_id = "2.2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EBS"
  })
}

control "cis_compute_service_v100_2_3" {
  title         = "2.3 Ensure Tag Policies are enabled"
  description   = "Tag policies help you standardize tags on all tagged resources across your organization."
  query         = query.organizational_tag_policies_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_3.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Organizations"
  })
}

control "cis_compute_service_v100_2_4" {
  title         = "2.4 Ensure an Organizational EC2 Tag Policy has been created"
  description   = "A tag policy enables you to define tag compliance rules to help you maintain consistency in the tags attached to your organization's resources."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_4.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_5" {
  title         = "2.5 Ensure no AWS EC2 Instances are older than 180 days"
  description   = "Identify any running AWS EC2 instances older than 180 days."
  query         = query.ec2_instance_not_older_than_180_days
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_5.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_6" {
  title         = "2.6 Ensure detailed monitoring is enable for production EC2 Instances"
  description   = "Ensure that detailed monitoring is enabled for your Amazon EC2 instances."
  query         = query.ec2_instance_detailed_monitoring_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_6.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.6"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_7" {
  title         = "2.7 Ensure Default EC2 Security groups are not being used"
  description   = "When an EC2 instance is launched a specified custom security group should be assigned to the instance."
  query         = query.vpc_default_security_group_restricts_all_traffic
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_7.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_8" {
  title         = "2.8 Ensure the Use of IMDSv2 is Enforced on All Existing Instances"
  description   = "Ensure the Instance Metadata Service Version 2 (IMDSv2) method is enabled on all running instances."
  query         = query.ec2_instance_uses_imdsv2
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_8.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.8"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_9" {
  title         = "2.9 Ensure use of AWS Systems Manager to manage EC2 instances"
  description   = "An inventory and management of Amazon Elastic Compute Cloud (Amazon EC2) instances is made possible with AWS Systems Manager."
  query         = query.ec2_instance_ssm_managed
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_9.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.9"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_10" {
  title         = "2.10 Ensure unused ENIs are removed"
  description   = "Identify and delete any unused Amazon AWS Elastic Network Interfaces in order to adhere to best practices and to avoid reaching the service limit. An AWS Elastic Network Interface (ENI) is pronounced unused when is not attached anymore to an EC2 instance."
  query         = query.ec2_network_interface_unused
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_10.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_11" {
  title         = "2.11 Ensure instances stopped for over 90 days are removed"
  description   = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  query         = query.ec2_stopped_instance_90_days
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_11.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_12" {
  title         = "2.12 Ensure EBS volumes attached to an EC2 instance is marked for deletion upon instance termination"
  description   = "This rule ensures that Amazon Elastic Block Store volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances are marked for deletion when an instance is terminated. If an Amazon EBS volume isn't deleted when the instance that it's attached to is terminated, it may violate the concept of least functionality."
  query         = query.ec2_instance_attached_ebs_volume_delete_on_termination_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_12.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_13" {
  title         = "2.13 Ensure Secrets and Sensitive Data are not stored directly in EC2 User Data"
  description   = "User Data can be specified when launching an ec2 instance. Examples include specifying parameters for configuring the instance or including a simple script."
  query         = query.ec2_instance_user_data_no_secrets
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_13.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.13"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/EC2"
  })
}

control "cis_compute_service_v100_2_14" {
  title         = "2.14 Ensure EC2 Auto Scaling Groups Propagate Tags to EC2 Instances that it launches"
  description   = "Tags can help with managing, identifying, organizing, searching for, and filtering resources. Additionally, tags can help with security and compliance. Tags can be propagated from an Auto Scaling group to the EC2 instances that it launches."
  query         = query.autoscaling_group_propagate_tags_to_ec2_instance_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_2_14.md")

  tags = merge(local.cis_compute_service_v100_2_common_tags, {
    cis_item_id = "2.14"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EC2"
  })
}
