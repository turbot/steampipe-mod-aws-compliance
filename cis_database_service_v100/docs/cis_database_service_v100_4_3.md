## Description

Encryption at rest in Amazon DynamoDB enhances the security of your data by encrypting it using AWS Key Management Service (AWS KMS) keys. Here is how to enable encryption at rest while creating a DynamoDB table.

Once the user is in their AWS account, they should open the DynamoDB to create the table and enable encryption. A key would be required to be created to enable encryption. Only the authorized user would always have access to this key. Enabling encryption would keep the user’s data private and stored securely, which would only allow them to access it with their key.