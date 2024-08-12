locals {
  conformance_pack_lightsail_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Lightsail"
  })
}

control "lightsail_instance_ssh_rdp_http_ports_disabled" {
  title       = "Disable SSH and RDP ports for Lightsail instances when not needed"
  description = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should remove and disable these ports when not is use."
  query       = query.lightsail_instance_ssh_rdp_http_ports_disabled

  tags = local.conformance_pack_lightsail_common_tags
}

control "lightsail_instance_ssh_restricted_ip" {
  title       = "Ensure SSH is restricted to only IP address that should have this access"
  description = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should identify which IP address need access."
  query       = query.lightsail_instance_ssh_restricted_ip

  tags = local.conformance_pack_lightsail_common_tags
}

control "lightsail_instance_rdp_restricted_ip" {
  title       = "Ensure RDP is restricted to only IP address that should have this access"
  description = "Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should identify which IP address need access."
  query       = query.lightsail_instance_rdp_restricted_ip

  tags = local.conformance_pack_lightsail_common_tags
}

control "lightsail_instance_ipv6_networking_disabled" {
  title       = "Disable IPv6 Networking if not in use within your organization"
  description = "Any protocols enable within Lightsail by default that aren't being used should be disabled."
  query       = query.lightsail_instance_ipv6_networking_disabled

  tags = local.conformance_pack_lightsail_common_tags
}

query "lightsail_instance_ssh_rdp_http_ports_disabled" {
  sql = <<-EOQ
    with open_ports as (
      select
        i.name,
        jsonb_array_elements(i.networking -> 'Ports') as port
      from
        aws_lightsail_instance i
    ),
    port_cidrs as (
      select
        op.name,
        (op.port ->> 'FromPort')::int as from_port,
        (op.port ->> 'ToPort')::int as to_port,
        op.port ->> 'Protocol' as protocol,
        jsonb_array_elements_text(op.port -> 'Cidrs') as cidr,
        jsonb_array_elements_text(op.port -> 'Ipv6Cidrs') as ipv6_cidr
      from
        open_ports op
    ),
    insecure_ports as (
      select
        name
      from
        port_cidrs
      where
        from_port in (22, 3389, 80)
        and to_port in (22, 338, 80)
        and protocol = 'tcp'
        and (cidr = '0.0.0.0/0' or ipv6_cidr = '::/0')
    )
    select
      i.name as resource,
      case
        when p.name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when p.name is null then i.name || ' does not have SSH (22) or RDP (3389) or HTTP (80) ports open to 0.0.0.0/0 or ::/0.'
        else i.name || ' has SSH (22) or RDP (3389) or HTTP (80) ports open to 0.0.0.0/0 or ::/0.'
      end as reason,
      i.tags
    from
      aws_lightsail_instance i
      left join insecure_ports p on i.name = p.name;
  EOQ
}

query "lightsail_instance_ssh_restricted_ip" {
  sql = <<-EOQ
    with open_ports as (
      select
        name,
        jsonb_array_elements(networking -> 'Ports') as port
      from
        aws_lightsail_instance
    ),
    port_cidrs as (
      select
        op.name,
        (op.port ->> 'FromPort')::int as from_port,
        (op.port ->> 'ToPort')::int as to_port,
        op.port ->> 'Protocol' as protocol,
        jsonb_array_elements_text(op.port -> 'Cidrs') as cidr
      from
        open_ports op
    ),
    unrestricted_ssh_ports as (
      select
        name
      from
        port_cidrs
      where
        from_port = 22
        and to_port = 22
        and protocol = 'tcp'
        and cidr = '0.0.0.0/0'
    )
    select
      i.name as resource,
      case
        when usp.name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when usp.name is null then i.name || ' has SSH (22) restricted to specific IP addresses.'
        else i.name || ' has SSH (22) open to the world (0.0.0.0/0).'
      end as reason,
      i.tags
    from
      aws_lightsail_instance i
      left join unrestricted_ssh_ports usp on i.name = usp.name;
  EOQ
}

query "lightsail_instance_rdp_restricted_ip" {
  sql = <<-EOQ
    with open_ports as (
      select
        name,
        jsonb_array_elements(networking -> 'Ports') as port
      from
        aws_lightsail_instance
    ),
    port_cidrs as (
      select
        op.name,
        (op.port ->> 'FromPort')::int as from_port,
        (op.port ->> 'ToPort')::int as to_port,
        op.port ->> 'Protocol' as protocol,
        jsonb_array_elements_text(op.port -> 'Cidrs') as cidr
      from
        open_ports op
    ),
    unrestricted_rdp_ports as (
      select
        name
      from
        port_cidrs
      where
        from_port = 3389
        and to_port = 3389
        and protocol = 'tcp'
        and cidr = '0.0.0.0/0'
    )
    select
      i.name as resource,
      case
        when urp.name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when urp.name is null then i.name || ' has RDP (3389) restricted to specific IP addresses.'
        else i.name || ' has RDP (3389) open to the world (0.0.0.0/0).'
      end as reason,
      i.tags
    from
      aws_lightsail_instance i
      left join unrestricted_rdp_ports urp on i.name = urp.name;
  EOQ
}

query "lightsail_instance_ipv6_networking_disabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when ip_v6_addresses is null then 'ok'
        else 'alarm'
      end as status,
      case
        when ip_v6_addresses is null then name || ' has IPv6 networking disabled.'
        else name || ' has IPv6 networking enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_lightsail_instance;
  EOQ
}
