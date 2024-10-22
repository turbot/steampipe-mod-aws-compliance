locals {
  cis_compute_service_v100_11_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "11"
  })
}

benchmark "cis_compute_service_v100_11" {
  title         = "11 AWS SimSpace Weaver"
  description   = "AWS SimSpace Weaver is a service used to build and run dynamic, large-scale spatial simulations, such as city-scale digital twins and crowd simulations with millions of people and objects."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_11.md")
  children = [
    control.cis_compute_service_v100_11_1
  ]

  tags = merge(local.cis_compute_service_v100_11_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_11_1" {
  title         = "11.1 Ensure communications between your applications and clients is encrypted"
  description   = "SimSpace Weaver doesn't manage communications between your apps and the clients."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_11_1.md")

  tags = merge(local.cis_compute_service_v100_11_common_tags, {
    cis_item_id = "11.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/SimSpaceWeaver"
  })
}
