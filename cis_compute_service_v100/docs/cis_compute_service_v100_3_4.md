## Description

Any ports enable within Lightsail by default are open and exposed to the world. For SSH and RDP access you should identify which IP address need access.

Any ports enable within Lightsail by default are open and exposed to the world. This can result in outside traffic trying to access or even deny access to the Lightsail instances. Removing and adding approved IP address required for access.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com.
2. Click `All services`, click `Lightsail` under Compute.
3. This will open up the Lightsail console.
4. Select the `Linux Instance` you want to review.
5. Go to the Networking section.
6. Under IPv4 networking find the SSH rule as shown below.

```bash
Application Protocol Port or range / Code Restricted to
SSH TCP 22 Any IPv4 address
```

7. Click on the edit icon.
8. Click on the check box next to Restrict to IP address.
9. Under `Source IP address (192.0.2.0) or range (192.0.2.0-192.0.2.255 or 192.0.2.0/24)` type the IP address' you want.

###  From the Command Line:

1. Run `aws lightsail put-ins`

```bash
aws lightsail put-instance-public-ports --instance-name <instance_name> --
port-info
fromPort=22,protocol=TCP,toPort=22,cidrs=110.111.221.100/32,110.111.221.202/3
2
```

This command will enter the IP addresses that should have access to the instances identified above in the Audit.

2. Run `aws lightsail get-instance-port-states` for the Linux instance to confirm the new setting.

```bash
aws lightsail get-instance-port-states --instance-name <instance_name>
```

This command will provide a list of available Ports and show how the cidr value for Port 22 is now set.

```bash
{
  "fromPort": 22,
  "toPort": 22,
  "protocol": "tcp",
  "state": "open",
  "cidrs": [
  "110.111.221.100/32",
  "110.111.221.202/32"
  ],
  "cidrListAliases": []
},
```

3. Repeat the remediation below for all other instances identified in the Audit.