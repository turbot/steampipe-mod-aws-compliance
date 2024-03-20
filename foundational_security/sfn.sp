locals {
  foundational_security_sfn_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/StepFunctions"
  })
}

benchmark "foundational_security_sfn" {
  title         = "Step Functions"
  documentation = file("./foundational_security/docs/foundational_security_sfn.md")
  children = [
    control.foundational_security_sfn_1
  ]

  tags = merge(local.foundational_security_sfn_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_sfn_1" {
  title         = "1 Step Functions state machines should have logging turned on"
  description   = "This controls checks whether an AWS Step Functions state machine has logging turned on. The control fails if a state machine doesn't have logging turned on. If you provide a custom value for the logLevel parameter, the control passes only if the state machine has the specified logging level turned on."
  severity      = "medium"
  query         = query.sfn_state_machine_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_sfn_1.md")

  tags = merge(local.foundational_security_sfn_common_tags, {
    foundational_security_item_id  = "sfn_1"
    foundational_security_category = "logging"
  })
}