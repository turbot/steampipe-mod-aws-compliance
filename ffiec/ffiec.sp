locals {
  ffiec_common_tags = merge(local.aws_compliance_common_tags, {
    ffiec = "true"
    type  = "Benchmark"
  })
}

benchmark "ffiec" {
  title       = "Federal Financial Institutions Examination Council (FFIEC)"
  description = "The Council is a formal interagency body empowered to prescribe uniform principles, standards, and report forms for the federal examination of financial institutions by the Board of Governors of the Federal Reserve System (FRB), the Federal Deposit Insurance Corporation (FDIC), the National Credit Union Administration (NCUA), the Office of the Comptroller of the Currency (OCC), and the Consumer Financial Protection Bureau (CFPB), and to make recommendations to promote uniformity in the supervision of financial institutions."
  children = [
    benchmark.d_1,
    benchmark.d_2,
    # benchmark.d_3,
    benchmark.d_4,
    benchmark.d_5
  ]
  tags = local.ffiec_common_tags
}
