## Description

This control checks that the Lambda function settings for runtimes match the expected values set for the supported runtimes for each language. This control checks for the following runtimes: `nodejs20.x`, `nodejs18.x`, `nodejs16.x`, `python3.12`, `python3.11`, `python3.10`, `python3.9`, `python3.8`, `ruby3.3`, `ruby3.2`, `java21`, `java17`, `java11`, `java8.al2`, `dotnet8`, `dotnet6`

[Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) are built around a combination of operating system, programming language, and software libraries that are subject to maintenance and security updates. When a runtime component is no longer supported for security updates, Lambda deprecates the runtime. Even though you cannot create functions that use the deprecated runtime, the function is still available to process invocation events. Make sure that your Lambda functions are current and do not use out-of-date runtime environments.

## Remediation

For more information on supported runtimes and deprecation schedules, see the [Runtime support policy](https://docs.aws.amazon.com/lambda/latest/dg/runtime-support-policy.html) section of the AWS Lambda Developer Guide. When you migrate your runtimes to the latest version, follow the syntax and guidance from the publishers of the language.
