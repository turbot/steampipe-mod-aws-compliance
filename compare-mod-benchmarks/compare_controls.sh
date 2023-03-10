#!/bin/sh

# May not work if using another instance of Steampipe
alias steampipe="/usr/local/bin/steampipe"

case $1 in
  "hipaa")
    framework=hipaa
    benchmarkPrefix=hipaa_
    benchmarkTag=hipaa
    ;;
  "nist_csf")
    framework=nist_csf
    benchmarkPrefix=nist_csf_
    benchmarkTag=nist_csf
    ;;
  "soc_2")
    framework=soc_2
    benchmarkPrefix=soc_2_
    benchmarkTag=soc_2
    ;;
  *)
    printf "Invalid or missing benchmark: ${1}\n"
    exit 1
    ;;
esac

printf 'Stopping steampipe service...\n'
steampipe service stop --force
printf 'Starting steampipe service...\n'
steampipe service start

benchmarksFilename=output/${framework}_benchmarks.json
frameworksFilename=output/${framework}_frameworks.json

printf "Writing benchmarks query to ${benchmarksFilename}\n"
STEAMPIPE_INTROSPECTION=info steampipe query "select replace(b.resource_name, '${benchmarkPrefix}', '') as benchmark, split_part(c, '.', 3) as steampipe_control, 'aws_config' as source_type from steampipe_benchmark as b, jsonb_array_elements_text(children) as c where bool(tags ->> '${benchmarkTag}') and c ilike 'aws_compliance.control.%' order by benchmark, source_type, steampipe_control" --output json > ${benchmarksFilename}

printf "Writing AWS Audit Manager query to ${frameworksFilename}\n"

# Include Security Hub mappings as well, which are useful but require manual
# mapping to Config rules
case $1 in
  "hipaa")
    # Convert 164.308(a)(1)(ii)(A) to 164_308_a_1_ii_a, 164.308(a)(8) to 164_308_a_8
    steampipe query "select lower(replace(regexp_replace(c ->> 'Name', '[\.\(]', '_', 'g'), ')', '')) as steampipe_benchmark, lower(cms -> 'SourceKeyword' ->> 'KeywordValue') as steampipe_control, lower(cms ->> 'SourceType') as source_type from aws_auditmanager_framework as f, jsonb_array_elements(control_sets) as cs, jsonb_array_elements(cs -> 'Controls') as c, jsonb_array_elements(c -> 'ControlMappingSources') as cms where lower(name) = 'hipaa security rule 2003' and lower(cms ->> 'SourceType') in ('aws_config', 'aws_security_hub') order by steampipe_benchmark, source_type, steampipe_control" --output json > ${frameworksFilename}
    ;;
  "nist_csf")
    # Convert "DE.CM-7:Monitoring for unauthorized personnel, connections, devices, and software is performed" to de_cm_7
    # "PR.DS-3:Assets are formally managed throughout removal, transfers, and disposition" to pr_ds_3
    steampipe query "select lower(regexp_replace(split_part(c ->> 'Name', ':', 1), '([\.\-])', '_', 'g')) as steampipe_benchmark, lower(cms -> 'SourceKeyword' ->> 'KeywordValue') as steampipe_control, lower(cms ->> 'SourceType') as source_type from aws_auditmanager_framework as f, jsonb_array_elements(control_sets) as cs, jsonb_array_elements(cs -> 'Controls') as c, jsonb_array_elements(c -> 'ControlMappingSources') as cms where lower(name) = 'nist cybersecurity framework version 1.1' and lower(cms ->> 'SourceType') in ('aws_config', 'aws_security_hub') order by steampipe_benchmark, source_type, steampipe_control" --output json > ${frameworksFilename}
    ;;
  "soc_2")
    # Convert CC1.2 to cc_1_2, P6.1 to p_6_1
    steampipe query "select lower(replace(regexp_replace(split_part(c ->> 'Name', ' ', 1), '([\d])', '_\1.', 'g'), '.', '')) as steampipe_benchmark, lower(cms -> 'SourceKeyword' ->> 'KeywordValue') as steampipe_control, lower(cms ->> 'SourceType') as source_type from aws_auditmanager_framework as f, jsonb_array_elements(control_sets) as cs, jsonb_array_elements(cs -> 'Controls') as c, jsonb_array_elements(c -> 'ControlMappingSources') as cms where lower(name) = 'soc 2' and lower(cms ->> 'SourceType') in ('aws_config', 'aws_security_hub') order by steampipe_benchmark, source_type, steampipe_control" --output json > ${frameworksFilename}
    ;;
  *) printf "Invalid or missing benchmark"
    ;;
esac

printf 'Stopping steampipe service...\n'
steampipe service stop --force

printf 'Comparing control results...\n'
node main.js ${framework}
