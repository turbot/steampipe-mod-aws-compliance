locals {
  all_controls_sfn_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/StepFunctions"
  })
}

benchmark "all_controls_sfn" {
  title       = "Step Functions"
  description = "This section contains recommendations for configuring Step Functions resources."
  children = [
    control.sfn_state_machine_logging_enabled
  ]

  tags = merge(local.all_controls_sfn_common_tags, {
    type = "Benchmark"
  })
}



