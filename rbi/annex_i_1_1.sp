locals {
  rbi_annex_i_1_1_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_1_1"
  })
}

benchmark "rbi_annex_i_1_1" {
  title       = "Annex_I(1.1)"
  description = "TODO"
  children = [
    control.rbi_annex_i_1_1_ec2_instance_ssm_manged
  ]
  tags = local.rbi_annex_i_1_1_common_tags
}

control "rbi_annex_i_1_1_ec2_instance_ssm_manged" {
  title       = "EC2 instances should be managed by AWS Systems Manager"
  description = "An inventory of the software platforms and applications within the organization is possible by managing Amazon Elastic Compute Cloud (Amazon EC2) instances with AWS Systems Manager."
  sql         = query.ec2_instance_ssm_manged.sql

  tags = merge(local.rbi_annex_i_1_1_common_tags, {
    service = "ssm"
  })
}