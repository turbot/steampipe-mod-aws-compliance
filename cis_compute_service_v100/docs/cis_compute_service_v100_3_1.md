## Description

Amazon Lightsail is a virtual private server (VPS) provider and is the easiest way to get started with AWS for developers, small businesses, students, and other users who need a solution to build and host their applications on cloud.

Lightsail offers a range of operating system and application templates that are automatically installed when you create a new Lightsail instance. Application templates include WordPress, Drupal, Joomla!, Ghost, Magento, Redmine, LAMP, Nginx (LEMP), MEAN, Node.js, Django, and more. You can install additional software on your instances by using the in-browser SSH or your own SSH client.

## Remediation

To process and apply the latest updates for the application you are using is a manual process. Often dependent on the application itself and the operating system you are utilizing for the Lightsail instance.

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Instance` you want to update.
5. Make sure the instance status is running.
6. Click on `Snapshots`.
7. Under `Manual snapshots` click on + Create snapshot.
8. Give it a name you will recognize.
9. Click on `create`.

```bash
while in process it will show 'Snapshotting...'
```

10. Once the date and time and snapshot name appears it is completed.
11. Click on `Connect`.
12. Run the updates for the application discovered above in the Audit.
13. Repeat steps no. 4 – 12 to apply any application updates required on the Lightsail instances that you are running.