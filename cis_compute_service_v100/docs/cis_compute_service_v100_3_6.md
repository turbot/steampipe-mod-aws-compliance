## Description

Any protocols enable within Lightsail by default that aren't being used should be disabled.

Any ports enable within Lightsail by default are open and exposed to the world. This can result in outside traffic trying to access or even deny access to the Lightsail instances. Removing and disabling a protocol when not in use even if restricted by IP address is the safest solution especially when it is not required for access.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Windows or Linux Instance` you want to review.
5. Go to the Networking section.
6. Under IPv6 networking click on the check mark next to `IPv6 networking is enabled`.
7. In the `Disable IPv6 for this instance?`.
8. Click on `Yes, disable`.