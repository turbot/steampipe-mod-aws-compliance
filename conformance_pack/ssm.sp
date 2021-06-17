locals {
  conformance_pack_ssm_common_tags = {
    service = "ssm"
  }
}

control "ec2_instance_ssm_managed" {
  title       = "EC2 instances should be managed by AWS Systems Manager"
  description = "An inventory of the software platforms and applications within the organization is possible by managing Amazon Elastic Compute Cloud (Amazon EC2) instances with AWS Systems Manager."
  sql         = query.ec2_instance_ssm_managed.sql
  tags        = local.conformance_pack_ssm_common_tags
}

control "ssm_managed_instance_compliance_association_compliant" {
  title       = "EC2 instances managed by Systems Manager should be compliant after association execution on instance"
  description = "Use AWS Systems Manager Associations to help with inventory of software platforms and applications within an organization."
  sql         = query.ssm_managed_instance_compliance_association_compliant.sql
  tags        = local.conformance_pack_ssm_common_tags
}

control "ssm_managed_instance_compliance_patch_compliant" {
  title       = "EC2 instances managed by Systems Manager should be compliant with patching requirements"
  description = "Enable this rule to help with identification and documentation of Amazon Elastic Compute Cloud (Amazon EC2) vulnerabilities."
  sql         = query.ssm_managed_instance_compliance_patch_compliant.sql
  tags        = local.conformance_pack_ssm_common_tags
}