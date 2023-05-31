benchmark "nist_800_171_rev_2_2" {
  title       = "2 System Enviornment"
  description = "Include a detailed topology narrative and graphic that clearly depicts the system boundaries, system interconnections, and key devices. (Note: this does not require depicting every workstation or desktop, but include an instance for each operating system in use, an instance for portable components (if applicable), all virtual and physical servers (e.g., file, print, web, database, application), as well as any networked workstations (e.g., Unix, Windows, Mac, Linux), firewalls, routers, switches, copiers, printers, lab equipment, handhelds). If components of other systems that interconnect/interface with this system need to be shown on the diagram, denote the system boundaries by referencing the security plans or names and owners of the other system(s) in the diagram. [Insert a system topology graphic. Provide a narrative consistent with the graphic that clearly lists and describes each system component.]"
  children = [
    benchmark.nist_800_171_rev_2_2_2
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_2_2" {
  title       = "2.2. List all software components installed on the system"
  description = "List all software components installed on the system."
  children = [
    control.config_enabled_all_regions,
    control.ec2_instance_ssm_managed
  ]

  tags = local.nist_800_171_rev_2_common_tags
}
