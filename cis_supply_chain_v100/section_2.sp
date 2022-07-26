locals {
  cis_supply_chain_v100_2_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_supply_chain_v100_2_1_common_tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    cis_section_id = "2.1"
  })
}

benchmark "cis_supply_chain_v100_2" {
  title         = "2 Build Pipelines"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2.md")
  children = [
    benchmark.cis_supply_chain_v100_2_1
  ]

  tags = merge(local.cis_supply_chain_v100_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_2_1" {
  title         = "2.1 Build Environment"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1.md")
  children = [
    control.cis_supply_chain_v100_2_1_3,
    control.cis_supply_chain_v100_2_1_4,
    control.cis_supply_chain_v100_2_1_5
  ]

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    service = "AWS/CodeBuild"
    type    = "Benchmark"
  })
}

control "cis_supply_chain_v100_2_1_3" {
  title         = "2.1.3 Ensure the build environment is logged"
  description   = "Keep build logs of the build environment detailing configuration and all activity within it. Also, consider storing them in a centralized organizational log store."
  sql           = query.codebuild_project_logging_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_3.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_type    = "automated"
    service     = "AWS/CodeBuild"
  })
}

control "cis_supply_chain_v100_2_1_4" {
  title         = "2.1.4 Ensure the creation of the build environment is automated"
  description   = "Automate the creation of the build environment."
  sql           = query.codebuild_project_automated_deployment_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_4.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_type    = "automated"
    service     = "AWS/CodeBuild"
  })
}

control "cis_supply_chain_v100_2_1_5" {
  title         = "2.1.5 Ensure access to build environments is limited"
  description   = "Restrict access to the build environment to trusted and qualified users only."
  sql           = query.codebuild_project_not_public.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_2_1_5.md")

  tags = merge(local.cis_supply_chain_v100_2_1_common_tags, {
    cis_item_id = "2.1.5"
    cis_type    = "automated"
    service     = "AWS/CodeBuild"
  })
}
