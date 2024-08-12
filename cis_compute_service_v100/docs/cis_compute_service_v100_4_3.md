## Description

Lambda functions often have to access a database or other services within your environment.

Credentials used to access databases and other AWS Services need to be managed and regularly rotated to keep access into critical systems secure. Keeping any credentials and manually updating the passwords would be cumbersome, but AWS Secrets Manager allows you to manage and rotate passwords.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Secrets Manager` under Security, Identity and Compliance.
3. Click on `Secrets`.
4. Click on `Store a new secret`.
5. Select the `Secret type`.
6. Enter the information.

```
For the `3 db types` listed enter the credentials and select the database.
For `other database` enter the credentials, select the db type and enter the
connection parameters.
```

For `Other type of secret` (Lambda) create the keys and values used. - example
Username yepyep Password yepyep choose an encryption key or create a new one ***if you add a new key it will take you to the KMS console. Once you create the new key you can then select it here.***

7. Click `Next`.
8. Give the secret a name associated with your organization style and lambda.
9. Click `Next`.
10. Configure the auto rotation.

```
Rotation schedule leave as default
Select the lambda function you use to rotate the key
```

11. Click `Next`.
12. Review all the settings.
13. Click `Store`.