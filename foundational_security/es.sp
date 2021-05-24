locals {
  foundational_security_es_common_tags = merge(local.foundational_security_common_tags, {
    service = "es"
  })
}

benchmark "foundational_security_es" {
  title         = "Elasticsearch"
  #documentation = file("./foundational_security/docs/foundational_security_es.md")
  children = [
    control.foundational_security_es_1,
    control.foundational_security_es_2,
    control.foundational_security_es_3
  ]
  tags          = local.foundational_security_es_common_tags
}

control "foundational_security_es_1" {
  title         = "1 Elasticsearch domains should have encryption at-rest enabled"
  description   = "This control checks whether Amazon Elasticsearch Service (Amazon ES) domains have encryption at rest configuration enabled. The check fails if encryption at rest is not enabled."
  severity      = "medium"
  sql           = query.es_domain_encryption_at_rest_enabled.sql
  #documentation = file("./foundational_security/docs/foundational_security_es_1.md")

  tags = merge(local.foundational_security_es_common_tags, {
    foundational_security_item_id  = "es_1"
    #foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_es_2" {
  title         = "2 Amazon Elasticsearch Service domains should be in a VPC"
  description   = "This control checks whether Amazon Elasticsearch Service domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access. You should ensure that Amazon ES domains are not attached to public subnets."
  severity      = "critical"
  sql           = query.es_domain_in_vpc.sql
  #documentation = file("./foundational_security/docs/foundational_security_es_2.md")

  tags = merge(local.foundational_security_es_common_tags, {
    foundational_security_item_id  = "es_2"
    #foundational_security_category = "resources_within_vpc"
  })
}

control "foundational_security_es_3" {
  title         = "3 Amazon Elasticsearch Service domains should encrypt data sent between nodes"
  description   = "This control checks whether Amazon ES domains have node-to-node encryption enabled."
  severity      = "medium"
  sql           = query.es_domain_encryption_between_nodes.sql
  #documentation = file("./foundational_security/docs/foundational_security_es_3.md")

  tags = merge(local.foundational_security_es_common_tags, {
    foundational_security_item_id  = "es_3"
    #foundational_security_category = "encryption_of_data_in_transit"
  })
}
