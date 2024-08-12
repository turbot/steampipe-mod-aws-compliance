## Description

Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should remove and disable these ports when not is use.

Any ports enable within Lightsail by default are open and exposed to the world. This can result in outside traffic trying to access or even deny access to the Lightsail instances. Removing and disabling a protocol when not in use even if restricted by IP address is the safest solution especially when it is not required for access.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Windows or Linux Instance` you want to review.
5. Go to the Networking section.
6. If it is a Windows instance confirm that SSH has been removed. If it is a Linux instance confirm RDP has been removed.
7. If either ssh(Port 22) is in the Windows system and RDP(Port 3389) is in the Linux system click the bucket icon to delete it.
8. If the server needs HTTP, TCP Port 80 confirm that the application forwards Port 80 to HTTPS, TCP Port 443.
9. If the server does not need HTTP click the bucket icon to delete it.
10. Confirm that there are no other unused or unneeded ports.
11. If the system has other ports that are not required or in use click the bucket icon to delete it.

###  From the Command Line:

1. Run `aws lightsail close-instance-public-ports`

For Windows:

```bash
aws lightsail close-instance-public-ports --instance-name
<Windows_Instance_Name> --port-info fromPort=22,protocol=TCP,toPort=22
```

For Linux:

```bash
aws lightsail close-instance-public-ports --instance-name
<Linux_Instance_Name> --port-info fromPort=3389,protocol=TCP,toPort=3389
```

For HTTP:

```bash
aws lightsail close-instance-public-ports --instance-name <ANY_Instance_Name>
--port-info fromPort=80,protocol=TCP,toPort=80
```

2. Repeat for all instance names identified in the audit that have SSH, RDP or HTTP's open and are not required based on the OS or the use of the system.