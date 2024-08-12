## Description

Change the default settings for the administrator login names and passwords of the application software that you install on Lightsail instances.

Default administrator login names and passwords for applications used on Lightsail instances can be used by hackers and individuals to break into your servers.

## Remediation

To process and apply the latest updates for the application you are using is a manual process. Often dependent on the application itself and the operating system you are utilizing for the Lightsail instance.

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Instance` you want to update the `default administrator` settings.
5. Make sure the instance status is `running`.
6. Click on `Snapshots`.
7. Under Manual snapshots click on `+ Create snapshot`.
8. Give it a name you will recognize.
9. Click on `create`.

```bash
while in process it will show Snapshotting...
```

10. Once the date and time and snapshot name appears it is completed.
11. Click on `Connect`.
12. Run the process to change either the `default administrator` name or password or both.
13. Repeat steps no. 4 – 12 to apply any application `default administrator`
changes required on the Lightsail instances that you are running.