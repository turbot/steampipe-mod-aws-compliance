locals {
  cis_supply_chain_v100_4_common_tags = merge(local.cis_supply_chain_v100_common_tags, {
    cis_section_id = "4"
  })
}

locals {
  cis_supply_chain_v100_4_1_common_tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    cis_section_id = "4.1"
  })
  cis_supply_chain_v100_4_2_common_tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    cis_section_id = "4.2"
  })
}

benchmark "cis_supply_chain_v100_4" {
  title         = "4 Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4.md")
  children = [
    benchmark.cis_supply_chain_v100_4_1,
    benchmark.cis_supply_chain_v100_4_2
  ]

  tags = merge(local.cis_supply_chain_v100_4_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_supply_chain_v100_4_1" {
  title         = "4.1 Verification"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1.md")
  children = [
    control.cis_supply_chain_v100_4_1_2,
  ]

  tags = merge(local.cis_supply_chain_v100_4_1_common_tags, {
    service = "AWS/CodeArtifact"
    type    = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_1_2" {
  title         = "4.1.2 Ensure artifacts are encrypted before distribution"
  description   = "Encrypt artifacts before they are distributed and ensure only trusted platforms have decryption capabilities."
  sql           = query.codeartifact_domain_encryption_enabled.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_1_2.md")

  tags = merge(local.cis_supply_chain_v100_4_1_common_tags, {
    cis_item_id = "4.1.2"
    cis_type    = "automated"
    service     = "AWS/CodeArtifact"
  })
}

benchmark "cis_supply_chain_v100_4_2" {
  title         = "4.2 Access to Artifacts"
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2.md")
  children = [
    control.cis_supply_chain_v100_4_2_2,
  ]

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    service = "AWS/CodeArtifact"
    type    = "Benchmark"
  })
}

control "cis_supply_chain_v100_4_2_2" {
  title         = "4.2.2 Ensure number of permitted users who may upload new artifacts is minimized"
  description   = "Minimize the ability to upload artifacts to the lowest number of trusted users possible."
  sql           = query.codeartifact_domain_prohibit_public_access.sql
  documentation = file("./cis_supply_chain_v100/docs/cis_supply_chain_v100_4_2_2.md")

  tags = merge(local.cis_supply_chain_v100_4_2_common_tags, {
    cis_item_id = "4.2.2"
    cis_type    = "automated"
    service     = "AWS/CodeArtifact"
  })
}
