## Description

Windows server based Lightsail instances are still managed by the consumer and any security updates or patches have to be installed and maintained by the user.

Windows Server-based Lightsail instances need to be updated with the latest security patches so they are not vulnerable to attacks. Be sure your server is configured to download and install updates.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Windows Instance` you want to review.
5. Make sure the instance status is `running`.
6. Connect to the `instance` using `Connect using RDP`.
7. Log in using the credentials you have set for this instance.
8. Open a command prompt.
9. Type sconfig, and then press Enter.

```
Windows Update Settings are at number 5 and by default are set to Automatic.
```

If this is not the current setting continue with step 10. If this is the current setting skip to step 12

10. Type 5, and then press Enter.
11. Type A for `Automatic` and then press Enter. Wait until the setting is saved and you return back to the server configuration menu.
12. Type 6, and then press Enter.
13. Type A to search for (A)ll updates in the new command window, and then press Enter.
14. Type A again to install (A)ll updates, and then press Enter.

When finished, you see a message with the installation results and more instructions (if those apply).