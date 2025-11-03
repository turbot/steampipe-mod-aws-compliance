To obtain the latest version of the official guide, please visit http://benchmarks.cisecurity.org.

## Overview

All CIS Benchmarks focus on technical configuration settings used to maintain and/or increase the security of the addressed technology, and they should be used in conjunction with other essential cyber hygiene tasks like:

-  Monitoring the base operating system and applications for vulnerabilities and quickly updating with the latest security patches.
- End-point protection (Antivirus software, Endpoint Detection and Response (EDR), etc.).
- Logging and monitoring user and system activity.

In the end, the CIS Benchmarks are designed to be a key component of a comprehensive cybersecurity program.

### Important Usage Information

All CIS Benchmarks are available free for non-commercial use from the [CIS Website](https://www.cisecurity.org/cis-benchmarks). They can be used to manually assess and remediate systems and applications. In lieu of manual assessment and remediation, there are several tools available to assist with assessment:
- [CIS Configuration Assessment Tool (CIS-CAT® Pro Assessor)](https://www.cisecurity.org/cybersecurity-tools/cis-cat-pro)
- [CIS Benchmarks Certified 3rd Party Tooling](https://www.cisecurity.org/cis-securesuite/members/vendors)

These tools make the hardening process much more scalable for large numbers of systems and applications.

### NOTE:
Some tooling focuses only on the CIS Benchmarks Recommendations that can be fully automated (skipping ones marked Manual). It is important that ALL Recommendations (Automated and Manual) be addressed, since all are important for properly securing systems and are typically in scope for audits.

In addition, CIS has developed CIS [Build Kits](https://www.cisecurity.org/cis-securesuite/cis-securesuite-build-kit-content) for some common technologies to assist in applying CIS Benchmarks Recommendations.

When remediating systems (changing configuration settings on deployed systems as per the CIS Benchmarks Recommendations), please approach this with caution and test thoroughly.


The following is a reasonable remediation approach to follow:

1. NEVER deploy a CIS Build Kit, or any internally developed remediation method, to production systems without proper testing.
2. Proper testing consists of the following:
  - Understand the configuration (including installed applications) of the targeted systems.
  - Read the Impact section of the given Recommendation to help determine if there might be an issue with the targeted systems.
  - Test the configuration changes on representative lab system(s). This way if there is some issue it can be resolved prior to deploying to any production systems.
  - When confident, initially deploy to a small sub-set of users and monitor closely for issues. This way if there is some issue it can be resolved prior to deploying more broadly.
  - When confident, iteratively deploy to additional groups and monitor closely for issues until deployment is complete. This way if there is some issue it can be resolved prior to continuing deployment.

### NOTE:
CIS and the CIS Benchmarks development communities in CIS WorkBench do their best to test and have high confidence in the Recommendations, but they cannot test potential conflicts with all possible system deployments. Known potential issues identified during CIS Benchmarks development are documented in the Impact section of each Recommendation.

By using CIS and/or CIS Benchmarks Certified tools, and being careful with remediation deployment, it is possible to harden large numbers of deployed systems in a cost effective, efficient, and safe manner.

### NOTE:
As previously stated, the PDF versions of the CIS Benchmarks are available for free, non-commercial use on the [CIS Website](https://www.cisecurity.org/cis-benchmarks). All other formats of the CIS Benchmarks (MS Word, Excel, and [Build Kits](https://www.cisecurity.org/cis-securesuite/cis-securesuite-build-kit-content)) are available for CIS [SecureSuite®](https://www.cisecurity.org/cis-securesuite) members.

CIS-CAT® Pro is also available to CIS [SecureSuite®](https://www.cisecurity.org/cis-securesuite) members.

### Target Technology Details

This document provides prescriptive guidance for configuring security options for a subset of Amazon Web Services with an emphasis on foundational, testable, and architecture agnostic settings. Some of the specific Amazon Web Services in scope for this document include:

- AWS Identity and Access Management (IAM)
- IAM Access Analyzer
- AWS Config
- AWS CloudTrail
- AWS CloudWatch
- AWS Simple Notification Service (SNS)
- AWS Simple Storage Service (S3)
- Elastic Compute Cloud (EC2)
- Relational Database Service (RDS)
- AWS VPC

## Profiles Definitions

The following configuration profiles are defined by this Benchmark:

### Level 1

Items in this profile intend to:
  - be practical and prudent;
  - provide security focused best practice hardening of a technology; and
  - limit impact to the utility of the technology beyond acceptable means.

### Level 2

This profile extends the "Level 1" profile. Items in this profile exhibit one or more
of the following characteristics:
  - are intended for environments or use cases where security is more critical than manageability and usability
  - acts as defense in depth measure
  - may impact the utility or performance of the technology
  - may include additional licensing, cost, or addition of third party software