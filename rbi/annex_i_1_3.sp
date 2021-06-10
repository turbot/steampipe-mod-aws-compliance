locals {
  rbi_annex_i_1_3_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_1_3"
  })
}

benchmark "rbi_annex_i_1_3" {
  title       = "Annex_I(1.3)"
  description = "TODO"
  children = [
    control.rbi_annex_i_1_3_acm_certificate_expires_30_days,
    control.rbi_annex_i_1_3_elb_application_drop_http_headers
  ]
  tags          = local.rbi_annex_i_1_3_common_tags
}

control "rbi_annex_i_1_3_acm_certificate_expires_30_days" {
  title       = "Imported ACM certificates should be renewed after a specified time period"
  description = "Ensure network integrity is protected by ensuring X509 certificates are issued by AWS ACM."
  sql         = query.acm_certificate_expires_30_days.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "acm"
  })
}

control "rbi_annex_i_1_3_elb_application_drop_http_headers" {
  title       = "ELB application load balancer should be configured to drop http headers"
  description = "Ensure that your Elastic Load Balancers (ELB) are configured to drop http headers."
  sql         = query.elb_application_drop_http_headers.sql

  tags = merge(local.rbi_annex_i_1_3_common_tags, {
    service = "elb"
  })
}
