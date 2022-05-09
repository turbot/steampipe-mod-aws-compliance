benchmark "fedramp_si" {
  title       = benchmark.nist_800_53_rev_4_sa.title
  description = benchmark.nist_800_53_rev_4_sa.description
  children = [
    # benchmark.fedramp_si_2,
  ]

  tags = local.fedramp_common_tags
}

# benchmark "fedramp_si_2" {
#   title       = benchmark.nist_800_53_rev_4_sa.title
#   description = benchmark.nist_800_53_rev_4_sa.description
#   children = [
#     benchmark.fedramp_si_2_2,
#   ]

#   tags = local.fedramp_common_tags
# }

# benchmark "fedramp_si_2_2" {
#   title       = benchmark.nist_800_53_rev_4_sa.title
#   description = benchmark.nist_800_53_rev_4_sa.description
#   children = [
#     # benchmark.fedramp_si,
#   ]

#   tags = local.fedramp_common_tags
# }