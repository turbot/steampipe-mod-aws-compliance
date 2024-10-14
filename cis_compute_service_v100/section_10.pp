locals {
  cis_compute_service_v100_10_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "10"
  })
}

benchmark "cis_compute_service_v100_10" {
  title         = "10 AWS App Runner"
  description   = "AWS App Runner is a fully managed service that makes it easy for developers to deploy from source code or container image directly to a scalable and secure web application."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_10.md")
  children = [
    control.cis_compute_service_v100_10_1
  ]

  tags = merge(local.cis_compute_service_v100_10_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_10_1" {
  title         = "10.1 Ensure you are using VPC Endpoints for source code access"
  description   = "App Runner needs access to your application source, so it can't be encrypted. Therefore, be sure to secure the connection between your development or deployment environment and App Runner."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_10_1.md")

  tags = merge(local.cis_compute_service_v100_10_common_tags, {
    cis_item_id = "10.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/AppRunner"
  })
}
