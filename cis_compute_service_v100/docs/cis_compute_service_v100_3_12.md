## Description

When you create a Windows Server-based instance, Lightsail randomly generates a long password that is hard to guess. You use this password uniquely with your new instance. You can use the default password to connect quickly to your instance using remote desktop (RDP). You are always logged in as the Administrator on your Lightsail instance.

Like any password it should be changed from the default and over time. The randomly generated password can be hard to remember and if anyone gains access to your AWS Lightsail environment they can utilize that to access your instances. For this reason you should change the password to something you can remember.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Windows Instance` you want to review.
5. Make sure the instance status is `running`.
6. Connect to the `instance` using `Connect using RDP`.
7. Log in using the credentials provided within the Lightsail console set for this instance.
8. Use the Windows Server password manager to change your password securely by press `Ctrl + Alt + Del`
9. Then choose `Change a password.`
**Be sure to keep a record of your password, because Lightsail doesn't store the new password you are setting.**
10. Type in the `New Password`.
11. Click `Save`.