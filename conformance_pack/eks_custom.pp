control "eks_cluster_support_check" {
  title       = "EKS Cluster Version End-of-Support Verification"
  description = "This control assesses each EKS cluster's Kubernetes version against a defined support mapping. It flags clusters that have a scheduled end-of-support date within the next five months or that use an unrecognized version, ensuring proactive management of cluster upgrades and minimizing risk of unsupported deployments."
  query       = query.eks_cluster_support_check

  tags = local.conformance_pack_eks_common_tags
}

control "eks_cluster_extended_support" {
  title       = "EKS Cluster Minimum Version Compliance Check"
  description = "This control verifies that EKS clusters are running on Kubernetes versions that meet or exceed the established minimum supported threshold (1.30). Clusters operating below this threshold are flagged for extended support, indicating the need for an upgrade to maintain security, stability, and access to vendor support."
  query       = query.eks_cluster_extended_support

  tags = local.conformance_pack_eks_common_tags
}


query "eks_cluster_support_check" {
  sql = <<-EOQ
WITH min_version AS (
  SELECT '1.30' AS version_min
),
eks_version_end_dates AS (
  SELECT * FROM (
    VALUES
      ('1.30', '2025-07-23'::date),
      ('1.31', '2025-11-26'::date),
      ('1.32', '2026-03-23'::date)
  ) AS t(version, support_end_date)
)
SELECT
  c.name,
  c.arn AS resource,
  c.version,
  m.version_min,
  v.support_end_date,
  CASE 
    WHEN c.version < m.version_min THEN 'ok'
    WHEN c.version >= m.version_min AND v.support_end_date IS NULL THEN 'alarm'
    WHEN c.version >= m.version_min AND v.support_end_date <= (current_date + interval '5 months') THEN 'alarm'
    WHEN c.version >= m.version_min AND v.support_end_date > (current_date + interval '5 months') THEN 'ok'
  END AS status,
  CASE 
    WHEN c.version < m.version_min THEN 
         c.name || ' cluster version ' || c.version || ' is below the minimum threshold (' || m.version_min || ') and is considered extended support.'
    WHEN c.version >= m.version_min AND v.support_end_date IS NULL THEN 
         c.name || ' cluster version ' || c.version || ' is not recognized in the support mapping, triggering alarm.'
    WHEN c.version >= m.version_min AND v.support_end_date <= (current_date + interval '5 months') THEN 
         c.name || ' cluster version ' || c.version || ' will no longer be supported on ' || to_char(v.support_end_date, 'DD Mon YYYY') || '.'
    WHEN c.version >= m.version_min AND v.support_end_date > (current_date + interval '5 months') THEN 
         c.name || ' cluster version ' || c.version || ' is supported until ' || to_char(v.support_end_date, 'DD Mon YYYY') || '.'
  END AS reason
  ${local.tag_dimensions_sql}
  ${local.common_dimensions_sql}
FROM aws_eks_cluster c
CROSS JOIN min_version m
LEFT JOIN eks_version_end_dates v
  ON c.version = v.version
ORDER BY c.name, c.version;
  EOQ
}


query "eks_cluster_extended_support" {
  sql = <<-EOQ
WITH min_version AS (
  SELECT '1.30' AS version_min
)
SELECT
  c.name,
  c.arn AS resource,
  c.version,
  m.version_min,
  CASE
    WHEN c.version < m.version_min THEN 'alarm'
    ELSE 'ok'
  END AS status,
  CASE
    WHEN c.version < m.version_min THEN
      c.name || ' cluster version ' || c.version || ' is extended support. Minimum supported version is ' || m.version_min || '.'
    ELSE
      c.name || ' cluster version ' || c.version || ' is supported.'
  END AS reason
  ${local.tag_dimensions_sql}
  ${local.common_dimensions_sql}
FROM aws_eks_cluster c
CROSS JOIN min_version m
ORDER BY c.name, c.version;
  EOQ
}
