# CIS Amazon Web Services Foundations Benchmark v6.0.0

This directory contains the CIS Amazon Web Services Foundations Benchmark v6.0.0 implementation for Steampipe compliance checks.

## Structure

```
cis_v600/
├── cis.pp                 # Main benchmark definition
├── section_2.pp          # Identity and Access Management controls
├── section_3.pp          # Storage controls
├── section_4.pp          # Logging controls
├── section_5.pp          # Monitoring controls
├── section_6.pp          # Networking controls
├── docs/                 # Documentation files
│   ├── cis_overview.md   # Benchmark overview
│   ├── cis_v600_2.md     # Section 2 documentation
│   ├── cis_v600_3.md     # Section 3 documentation
│   ├── cis_v600_4.md     # Section 4 documentation
│   ├── cis_v600_5.md     # Section 5 documentation
│   └── cis_v600_6.md     # Section 6 documentation
└── README.md             # This file
```

## Usage

To use this benchmark:

1. Ensure you have Steampipe installed and configured
2. Run the benchmark: `steampipe check benchmark.cis_v600`
3. Review the results and implement recommended controls

## Controls

This benchmark includes controls across five main categories:

- **Identity and Access Management** (21 controls)
- **Storage** (9 controls across S3, RDS, and EFS)
- **Logging** (9 controls)
- **Monitoring** (16 controls)
- **Networking** (7 controls)

## Compliance Levels

- **Level 1**: Basic security controls that should be implemented
- **Level 2**: Advanced security controls for enhanced security posture

## Control Types

- **Automated**: Can be checked programmatically
- **Manual**: Require manual review and verification

## Next Steps

1. Review the CIS v6.0.0 benchmark document
2. Update control descriptions and queries based on the actual requirements
3. Add specific documentation for each control
4. Test the benchmark implementation
5. Integrate with your compliance workflow
