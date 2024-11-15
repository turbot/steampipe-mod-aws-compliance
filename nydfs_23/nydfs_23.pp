locals {
  nydfs_23_common_tags = merge(local.aws_compliance_common_tags, {
    nydfs_23  = "true"
    type      = "Benchmark"
  })
}

benchmark "nydfs_23" {
  title         = "NYDFS 23"
  description   = "."
  documentation = file("./nydfs_23/docs/nydfs_23_overview.md")
  children = [
    benchmark.nydfs_23_500_02,
    benchmark.nydfs_23_500_06,
    benchmark.nydfs_23_500_07,
    benchmark.nydfs_23_500_08,
    benchmark.nydfs_23_500_12,
    benchmark.nydfs_23_500_14,
    benchmark.nydfs_23_500_15
  ]

  tags = local.nydfs_23_common_tags
}
