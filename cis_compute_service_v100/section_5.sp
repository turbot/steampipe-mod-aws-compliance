locals {
  cis_compute_service_v100_5_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "cis_compute_service_v100_5" {
  title         = "5 Batch"
  description   = "AWS Batch enables developers, scientists, and engineers to easily and efficiently run hundreds of thousands of batch computing jobs on AWS. AWS Batch dynamically provisions the optimal quantity and type of compute resources (e.g., CPU or memory optimized instances) based on the volume and specific resource requirements of the batch jobs submitted."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_5.md")
  children = [
    control.cis_compute_service_v100_5_1,
    control.cis_compute_service_v100_5_2
  ]

  tags = merge(local.cis_compute_service_v100_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_5_1" {
  title         = "5.1 Ensure AWS Batch is configured with AWS Cloudwatch Logs"
  description   = "You can configure Batch jobs to send log information to CloudWatch Logs."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_5_1.md")

  tags = merge(local.cis_compute_service_v100_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Batch"
  })
}

control "cis_compute_service_v100_5_2" {
  title         = "5.2 Ensure Batch roles are configured for cross-service confused deputy prevention"
  description   = "The Cross-service confused deputy problem is a security issue where an entity that doesn't have permission to perform an action can coerce a more-privileged entity to perform the action."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_5_2.md")

  tags = merge(local.cis_compute_service_v100_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Batch"
  })
}
