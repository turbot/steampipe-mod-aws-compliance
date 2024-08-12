locals {
  cis_compute_service_v100_3_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_compute_service_v100_3" {
  title         = "3 Lightsail"
  description   = "Amazon Lightsail offers easy-to-use virtual private server (VPS) instances, containers, storage, databases, to create a website or application in just a few clicks."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3.md")
  children = [
    control.cis_compute_service_v100_3_1,
    control.cis_compute_service_v100_3_2,
    control.cis_compute_service_v100_3_3,
    control.cis_compute_service_v100_3_4,
    control.cis_compute_service_v100_3_5,
    control.cis_compute_service_v100_3_6,
    control.cis_compute_service_v100_3_7,
    control.cis_compute_service_v100_3_8,
    control.cis_compute_service_v100_3_9,
    control.cis_compute_service_v100_3_10,
    control.cis_compute_service_v100_3_11,
    control.cis_compute_service_v100_3_12
  ]

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_3_1" {
  title         = "3.1 Apply updates to any apps running in Lightsail"
  description   = "Amazon Lightsail is a virtual private server (VPS) provider and is the easiest way to get started with AWS for developers, small businesses, students, and other users who need a solution to build and host their applications on cloud."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_1.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_2" {
  title         = "3.2 Change default Administrator login names and passwords for applications"
  description   = "Change the default settings for the administrator login names and passwords of the application software that you install on Lightsail instances."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_2.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_3" {
  title         = "3.3 Disable SSH and RDP ports for Lightsail instances when not needed"
  description   = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should remove and disable these ports when not is use."
  query         = query.lightsail_instance_ssh_rdp_http_ports_disabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_3.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_4" {
  title         = "3.4 Ensure SSH is restricted to only IP address that should have this access"
  description   = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should identify which IP address need access."
  query         = query.lightsail_instance_ssh_restricted_ip
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_4.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_5" {
  title         = "3.5 Ensure RDP is restricted to only IP address that should have this access"
  description   = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should identify which IP address need access."
  query         = query.lightsail_instance_rdp_restricted_ip
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_5.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_6" {
  title         = "3.6 Disable IPv6 Networking if not in use within your organization"
  description   = "Any protocols enable within Lightsail by default that aren't being used should be disabled."
  query         = query.lightsail_instance_ipv6_networking_disabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_6.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_7" {
  title         = "3.7 Ensure you are using an IAM policy to manage access to buckets in Lightsail"
  description   = "The following policy grants a user access to manage a specific bucket in the Amazon Lightsail object storage service."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_7.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_8" {
  title         = "3.8 Ensure Lightsail instances are attached to the buckets"
  description   = "Attaching an Amazon Lightsail instance to a Lightsail storage bucket gives it full programmatic access to the bucket and its objects."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_8.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_9" {
  title         = "3.9 Ensure that your Lightsail buckets are not publicly accessible"
  description   = "You can make all objects private, public (read-only) or private while making individual objects public (read-only). By default when creating a bucket the permissions are set to 'All objects are private'."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_9.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_10" {
  title         = "3.10 Enable storage bucket access logging"
  description   = "Access logging provides detailed records for the requests that are made to this bucket. This information can include the request type, the resources that are specified in the request, and the time and date that the request was processed. Access logs are useful for many applications."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_10.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_11" {
  title         = "3.11 Ensure your Windows Server based lightsail instances are updated with the latest security patches"
  description   = "Windows server based Lightsail instances are still managed by the consumer and any security updates or patches have to be installed and maintained by the user."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_11.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}

control "cis_compute_service_v100_3_12" {
  title         = "3.12 Change the auto-generated password for Windows based instances"
  description   = "When you create a Windows Server-based instance, Lightsail randomly generates a long password that is hard to guess. You use this password uniquely with your new instance. You can use the default password to connect quickly to your instance using remote desktop (RDP). You are always logged in as the Administrator on your Lightsail instance."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_3_12.md")

  tags = merge(local.cis_compute_service_v100_3_common_tags, {
    cis_item_id = "3.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lightsail"
  })
}
