benchmark "ffiec_d_5" {
  title       = "Cyber Incident Management and Resilience (Domain 5)"
  description = "Cyber incident management includes establishing, identifying, and analyzing cyber events; prioritizing the institution's containment or mitigation; and escalating information to appropriate stakeholders. Cyber resilience encompasses both planning and testing to maintain and recover ongoing operations during and following a cyber incident."
  children = [
    benchmark.ffiec_d_5_dr,
    benchmark.ffiec_d_5_er,
    benchmark.ffiec_d_5_ir
  ]

  tags = local.ffiec_common_tags
}
