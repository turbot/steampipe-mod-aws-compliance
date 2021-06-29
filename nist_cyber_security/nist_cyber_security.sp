locals {
  nist_cyber_security_common_tags = {
    nist_cyber_security = "true"
    plugin              = "aws"
  }
}

benchmark "nist_cyber_security" {
  title       = "NIST Cyber Security Framework"
  description = "NIST Cybersecurity Framework is a set of best practices, standards, and recommendations that help an organization improve its cybersecurity measures. The optional standards were compiled by NIST after former United States President Barack Obama signed an executive order in 2014."
  children = [
    benchmark.nist_cyber_security_de_ae_1,
    benchmark.nist_cyber_security_de_ae_2,
    benchmark.nist_cyber_security_id_am_2,
    benchmark.nist_cyber_security_id_am_3,
    benchmark.nist_cyber_security_id_am_6,
    benchmark.nist_cyber_security_id_be_5,
    benchmark.nist_cyber_security_id_ra_1,
    benchmark.nist_cyber_security_id_ra_2,
    benchmark.nist_cyber_security_id_ra_3,
    benchmark.nist_cyber_security_pr_ac_1,
    benchmark.nist_cyber_security_pr_ac_3,
    benchmark.nist_cyber_security_pr_ac_4,
    benchmark.nist_cyber_security_pr_ac_5,
    benchmark.nist_cyber_security_pr_ac_6,
    benchmark.nist_cyber_security_pr_ac_7,
    benchmark.nist_cyber_security_pr_ds_1,
    benchmark.nist_cyber_security_pr_ds_2,
    benchmark.nist_cyber_security_pr_ds_3,
    benchmark.nist_cyber_security_pr_ds_4,
    benchmark.nist_cyber_security_pr_ds_5,
    benchmark.nist_cyber_security_pr_ds_6,
    benchmark.nist_cyber_security_pr_ma_2,
    benchmark.nist_cyber_security_pr_pt_1,
    benchmark.nist_cyber_security_pr_pt_3,
    benchmark.nist_cyber_security_pr_pt_4,
    benchmark.nist_cyber_security_pr_pt_5,
  ]
  tags = local.nist_cyber_security_common_tags
}