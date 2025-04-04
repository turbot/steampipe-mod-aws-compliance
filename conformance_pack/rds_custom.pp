control "rds_instance_support_check" {
  title       = "RDS Instance Version End-of-Support Assessment"
  description = "This control assesses the engine versions of RDS instances against a defined support schedule. Instances projected to reach end-of-support within the next five months are flagged, enabling proactive remediation and ensuring that only supported versions remain in production."
  query       = query.rds_instance_support_check

  tags = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_extended_support" {
  title       = "RDS DB Instance Minimum Version Compliance"
  description = "This control verifies that RDS DB instances operate on engine versions meeting the minimum supported threshold. Instances running below this threshold are flagged as extended support, highlighting the need for timely upgrades to maintain security, performance, and vendor support."
  query       = query.rds_db_instance_extended_support

  tags = local.conformance_pack_rds_common_tags
}


query "rds_instance_support_check" {
  sql = <<-EOQ
WITH min_versions AS (
  SELECT * FROM (
    VALUES
      ('mysql', '8.0.37'),
      ('postgres', '14.12'),
      ('mariadb', '10.11.2008')
  ) AS t(engine, min_version)
),
version_end_dates AS (
  SELECT * FROM (
    VALUES 
      -- MySQL versions
      ('mysql', '8.0.40', '2026-03-31'::date),
      ('mysql', '8.0.39', '2025-09-30'::date),
      ('mysql', '8.0.37', '2025-09-30'::date),
      ('mysql', '8.0.36', '2025-03-31'::date),
      ('mysql', '8.0.35', '2025-03-31'::date),
      ('mysql', '8.0.34', '2025-03-31'::date),
      ('mysql', '8.0.33', '2025-03-31'::date),
      ('mysql', '8.0.32', '2025-03-31'::date),
      -- PostgreSQL versions
      ('postgres', '17.2', '2026-03-31'::date),
      ('postgres', '17.1', '2026-03-31'::date),
      ('postgres', '16.6', '2026-03-31'::date),
      ('postgres', '16.5', '2026-03-31'::date),
      ('postgres', '16.4', '2025-09-30'::date),
      ('postgres', '16.3', '2025-09-30'::date),
      ('postgres', '16.2', '2025-03-31'::date),
      ('postgres', '16.1', '2025-03-31'::date),
      ('postgres', '15.10', '2026-03-31'::date),
      ('postgres', '15.9', '2026-03-31'::date),
      ('postgres', '15.8', '2025-09-30'::date),
      ('postgres', '15.7', '2025-09-30'::date),
      ('postgres', '15.6', '2025-03-31'::date),
      ('postgres', '15.5', '2025-03-31'::date),
      ('postgres', '15.4', '2025-03-31'::date),
      ('postgres', '14.15', '2026-03-31'::date),
      ('postgres', '14.14', '2026-03-31'::date),
      ('postgres', '14.13', '2025-09-30'::date),
      ('postgres', '14.12', '2025-09-30'::date),
      ('postgres', '14.11', '2025-03-31'::date),
      ('postgres', '14.10', '2025-03-31'::date),
      ('postgres', '14.9',  '2025-03-31'::date),
      ('postgres', '13.18', '2026-02-28'::date),
      ('postgres', '13.17', '2026-02-28'::date),
      ('postgres', '13.16', '2025-09-30'::date),
      ('postgres', '13.15', '2025-09-30'::date),
      ('postgres', '13.14', '2025-03-31'::date),
      ('postgres', '13.13', '2025-03-31'::date),
      ('postgres', '13.12', '2025-03-31'::date),
      ('postgres', '13.11', '2025-03-31'::date),
      ('postgres', '12.22*', '2025-02-28'::date),
      ('postgres', '12.21', '2025-02-28'::date),
      ('postgres', '12.20', '2025-02-28'::date),
      ('postgres', '12.19', '2025-02-28'::date),
      ('postgres', '12.18', '2025-02-28'::date),
      ('postgres', '12.17', '2025-02-28'::date),
      ('postgres', '12.16', '2025-02-28'::date),
      ('postgres', '12.15', '2025-02-28'::date),
      ('postgres', '11.22*', '2024-02-29'::date),
      -- MariaDB versions
      ('mariadb', '10.11.10', '2026-03-31'::date),
      ('mariadb', '10.11.2009', '2026-03-31'::date),
      ('mariadb', '10.11.2008', '2025-09-30'::date),
      ('mariadb', '10.11.2007', '2025-03-31'::date),
      ('mariadb', '10.11.2006', '2025-03-31'::date),
      ('mariadb', '10.11.2005', '2025-03-31'::date),
      ('mariadb', '10.11.2004', '2025-03-31'::date),
      ('mariadb', '10.4.34',  '2025-02-28'::date),
      ('mariadb', '10.4.30',  '2025-02-28'::date)
  ) AS t(engine, version, end_date)
),
normalized_rds AS (
  SELECT
    r.arn,
    r.db_instance_identifier,
    CASE 
      WHEN r.engine IN ('aurora-postgresql') THEN 'postgres'
      WHEN r.engine IN ('aurora-mysql') THEN 'mysql'
      ELSE r.engine
    END AS normalized_engine,
    r.engine_version
  FROM aws_rds_db_instance r
  WHERE 
    CASE 
      WHEN r.engine IN ('aurora-postgresql','aurora-mysql') THEN 
        CASE WHEN r.engine = 'aurora-postgresql' THEN 'postgres' ELSE 'mysql' END
      ELSE r.engine
    END IN ('mysql','postgres','mariadb')
)
SELECT
  n.arn AS resource,
  n.db_instance_identifier AS rds_instance,
  n.normalized_engine,
  n.engine_version,
  m.min_version,
  v.end_date AS support_end_date,
  CASE
    WHEN n.engine_version < m.min_version THEN 'ok'
    WHEN v.end_date IS NOT NULL 
         AND ((n.normalized_engine = 'mariadb' AND v.end_date <= (current_date + interval '6 months'))
         OR (n.normalized_engine <> 'mariadb' AND v.end_date <= (current_date + interval '5 months')))
         THEN 'alarm'
    WHEN v.end_date IS NOT NULL 
         AND ((n.normalized_engine = 'mariadb' AND v.end_date > (current_date + interval '6 months'))
         OR (n.normalized_engine <> 'mariadb' AND v.end_date > (current_date + interval '5 months')))
         THEN 'ok'
    ELSE 'alarm'
  END AS status,
  CASE
    WHEN n.engine_version < m.min_version THEN
      n.db_instance_identifier || ' is below the minimum threshold (' || m.min_version || '); check not performed.'
    WHEN v.end_date IS NOT NULL 
         AND ((n.normalized_engine = 'mariadb' AND v.end_date <= (current_date + interval '6 months'))
         OR (n.normalized_engine <> 'mariadb' AND v.end_date <= (current_date + interval '5 months')))
         THEN n.db_instance_identifier || ' will no longer be supported on ' || to_char(v.end_date, 'DD Mon YYYY') || '.'
    WHEN v.end_date IS NOT NULL 
         AND ((n.normalized_engine = 'mariadb' AND v.end_date > (current_date + interval '6 months'))
         OR (n.normalized_engine <> 'mariadb' AND v.end_date > (current_date + interval '5 months')))
         THEN n.db_instance_identifier || ' is supported until ' || to_char(v.end_date, 'DD Mon YYYY') || '.'
    ELSE n.db_instance_identifier || ' is unrecognized.'
  END AS reason
FROM normalized_rds n
LEFT JOIN min_versions m ON n.normalized_engine = m.engine
LEFT JOIN version_end_dates v ON n.normalized_engine = v.engine AND n.engine_version = v.version
ORDER BY n.normalized_engine, n.engine_version, n.db_instance_identifier;
  EOQ
}



query "rds_db_instance_extended_support" {
  sql = <<-EOQ
WITH min_versions AS (
  SELECT * FROM (
    VALUES
      ('mysql', '8.0.37'),
      ('postgres', '14.12'),
      ('mariadb', '10.11.2008')
  ) AS t(engine, min_version)
),
normalized_rds AS (
  SELECT
    r.region,
    r.account_id,
    r.arn,
    r.db_instance_identifier,
    r.engine_version,
    r.title,
    CASE
      WHEN r.engine IN ('aurora-postgresql') THEN 'postgres'
      WHEN r.engine IN ('aurora-mysql') THEN 'mysql'
      ELSE r.engine
    END AS normalized_engine
  FROM aws_rds_db_instance r
  WHERE CASE
          WHEN r.engine IN ('aurora-postgresql','aurora-mysql') THEN
            CASE WHEN r.engine = 'aurora-postgresql' THEN 'postgres' ELSE 'mysql' END
          ELSE r.engine
        END IN ('mysql','postgres','mariadb')
)
SELECT
  n.arn AS resource,
  n.db_instance_identifier AS rds_instance,
  n.engine_version,
  m.min_version,
  n.normalized_engine AS engine,
  CASE
    WHEN n.engine_version < m.min_version THEN 'alarm'
    ELSE 'ok'
  END AS status,
  CASE
    WHEN n.engine_version < m.min_version THEN
      n.title || ' ' || n.normalized_engine || ' version ' || n.engine_version || ' is extended support. Minimum supported version is ' || m.min_version || '.'
    ELSE
      n.title || ' ' || n.normalized_engine || ' version ' || n.engine_version || ' is supported.'
  END AS reason
  ${local.tag_dimensions_sql}
  ${local.common_dimensions_sql}
FROM normalized_rds n
JOIN min_versions m ON n.normalized_engine = m.engine
ORDER BY n.normalized_engine, n.engine_version, n.db_instance_identifier;
  EOQ
}
