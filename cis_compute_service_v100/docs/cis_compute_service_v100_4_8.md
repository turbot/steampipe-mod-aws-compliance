## Description

Ensure that all your Amazon Lambda functions are configured to use the Code Signing feature in order to restrict the deployment of unverified code.

Code Signing, ensures that the function code is signed by an approved (trusted) source, and that it has not been altered since signing, and that the code signature has not expired or been revoked.

## Remediation

### From the Console:

1. Login to the AWS console using https://console.aws.amazon.com/signer.
2. Click on `Create Signing Profile` if none are set up. If you already have some created in the left panel click on `Signing Profiles, Create Signing Profile.`
***Note a Signing Profile is a trusted publisher and is analogous to the use of a digital signing certificate to generate signatures for your application code.***
3. On the `Create Signing Profile` setup page provide.

```
Profile name
Specify the Signature Validity period (6 months up to 12 months is recomended)
```

4. Click on `Create Profile`.
5. Go to the Amazon Lambda console https://console.aws.amazon.com/lambda/.
6. In the left panel, under Additional resources, click on `Code signing configurations`.
7. Click on `Create configuration`.
8. On the `Create code signing configuration` setup page:
- Description box - provide a short description to identify this configuration
- Click inside the `Signing profile version ARN` box and select the Signing Profile created above.
- For `Signature validation policy`, click the signature validation policy suitable for your Lambda function.
**Note - A signature check can fail if the code is not signed by an allowed Signing Profile, or if the signature has expired or has been revoked.**
- Click Enforce – blocking the deployment of the code and also issue a warning.
- Click `Create configuration`.
9. Go to the Amazon Lambda console https://console.aws.amazon.com/lambda/.
10. Click Functions.
11. Under Function name click on the name of the function that you want to review.
12. Click the Configuration tab.
13. In the left menu click Code signing.
14. Click Edit.
15. On the `Edit code signing`, select the code signing configuration created above from the drop down.
16. Click `Save`.
The Lambda function is now configured to use code signing.
17. Next Upload a signed .zip file or provide an S3 URL of a signed .zip made by a signing job in AWS Signer.
18. To start a signing job, go to AWS Signer console at https://console.aws.amazon.com/signer.
19. In the left panel, click on Signing Jobs.
20. Start a Signing Job to generate a signature for your code package and place the signed code package in the specified destination path.
21. Start Signing Job setup page:

```
- Select the Signing Profile created in dropdown list.
- Code asset source location, specify the Amazon S3 location of the code package (.zip file) to be signed. Only S3 buckets available in the current region are displayed and can be used
- Signature destination path with prefix where the signed code package should be uploaded.
- Start Job to deploy your new Signing Job
- Job status reads Succeeded, you can find the signed .zip package in your assigned S3 bucket.
```

22. Publish the signed code package to the selected Lambda function.
23. Amazon Lambda will perform signature checks to verify that the code has not been altered since signing.
**Note - The service verifies if the code is signed by one of the allowed signing profiles available.**
24. Repeat steps for each Lambda function that was captured in the Audit.