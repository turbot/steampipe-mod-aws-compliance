## Description

Attaching an Amazon Lightsail instance to a Lightsail storage bucket gives it full programmatic access to the bucket and its objects.

When you attach instances to buckets, you don't have to manage credentials like access keys. Resource access is ideal if you're configuring software or a plugin on your instance to upload files directly to your bucket. For example, if you want to configure a WordPress instance to store media files on a bucket configuration with bucket storage resource access allows for that securely.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Confirm that the `instance` you want to connect to the Storage bucket is in a `running` state.
5. If it is move on to Step 6. If it is not click on the instance name, then click on `Start`. Wait for the status to read `Running`.
6. Select `Storage`.
7. All Lightsail buckets are listed here.
8. Click on the bucket you want to associate with the instances.
9. Click `Permissions`.
10. Scroll down to `Resource access`.
11. Click on `Attach instance`.
12. Click on `Choose an instance`.
13. Select the instance.
14. Click Attach.
15. Repeat this for any other instances and buckets that need to be attached.

### From the Command Line:

1. Run `aws lightsail create-bucket`

```
aws lightsail create-bucket --bucket-name test-cli-bucket2 --bundle-id small_1_0
```

This command will create a bucket. If you want to review the bundle size ids run this command.

```
aws lightsail get-bucket-bundles
"bundles": [
{
"bundleId": "small_1_0",
"name": "Object Storage 5GB",
"price": 1.0,
"storagePerMonthInGb": 5,
"transferPerMonthInGb": 25,
"isActive": true
},
{
"bundleId": "medium_1_0",
"name": "Object Storage 100GB",
"price": 3.0,
"storagePerMonthInGb": 100,
"transferPerMonthInGb": 250,
"isActive": true
},
{
"bundleId": "large_1_0",
"name": "Object Storage 250GB",
"price": 5.0,
"storagePerMonthInGb": 250,
"transferPerMonthInGb": 500,
"isActive": true
}
]
```

Change the "bundleId" to the size of storage you need.
Repeat and create all the S3 buckets that you need for Lightsail.