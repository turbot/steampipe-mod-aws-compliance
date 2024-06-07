benchmark "rbi_itf_nbfc_4" {
  title       = "4. IT Operations"
  description = "IT Operations should support processing and storage of information, such that the required information is available in a timely, reliable, secure and resilient manner. The Board or Senior Management should take into consideration the risk associated with existing and planned IT operations and the risk tolerance and then establish and monitor policies for risk management."

  children = [
    benchmark.rbi_itf_nbfc_4_4
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "4"
  })
}

benchmark "rbi_itf_nbfc_4_4" {
  title       = "4.4 Management Information System (MIS)"
  description = "NBFCs may put in place MIS that assist the Top Management as well as the business heads in decision making and also to maintain an oversight over operations of various business verticals. With robust IT systems in place, NBFCs may have the following as part of an effective system generated MIS (indicative list)."

  children = [
    benchmark.rbi_itf_nbfc_4_4_g,
    benchmark.rbi_itf_nbfc_4_4_h,
    benchmark.rbi_itf_nbfc_4_4_i
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "4.4"
  })
}

benchmark "rbi_itf_nbfc_4_4_g" {
  title       = "4.4.g Fraud analysis"
  description = "Suspicious transaction analysis, embezzlement, theft or suspected money-laundering, misappropriation of assets, manipulation of financial records etc. The regulatory requirement of reporting fraud to RBI should be system driven."

  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "4.4.g"
  })
}

benchmark "rbi_itf_nbfc_4_4_h" {
  title       = "4.4.h Capacity and performance analysis"
  description = "Capacity and performance analysis of IT security systems."

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.ec2_instance_detailed_monitoring_enabled,
    control.ec2_instance_ebs_optimized,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_multiple_az_configured,
    control.guardduty_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.lambda_function_dead_letter_queue_configured,
    control.lambda_function_multiple_az_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_object_lock_enabled,
    control.securityhub_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "4.4.h"
  })
}

benchmark "rbi_itf_nbfc_4_4_i" {
  title       = "4.4.i Incident reporting"
  description = "Incident reporting, their impact and steps taken for non-recurrence of such events in the future."

  children = [
    control.guardduty_enabled,
    control.guardduty_finding_archived
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "4.4.i"
  })
}
