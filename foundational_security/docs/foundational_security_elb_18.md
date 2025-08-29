## Description

This control checks whether the listener for an Application Load Balancer or Network Load Balancer is configured to use a secure protocol for encryption of data in transit. The control fails if an Application Load Balancer listener isn't configured to use the HTTPS protocol, or a Network Load Balancer listener isn't configured to use the TLS protocol.

To encrypt data that's transmitted between a client and a load balancer, Elastic Load Balancer listeners should be configured to use industry-standard security protocols: HTTPS for Application Load Balancers, or TLS for Network Load Balancers. Otherwise, data that's transmitted between a client and a load balancer is vulnerable to interception, tampering, and unauthorized access. Use of HTTPS or TLS by a listener aligns with security best practices and helps ensure the confidentiality and integrity of data during transmission. This is particularly important for applications that handle sensitive information, or must comply with security standards that require encryption of data in transit.

## Remediation

For information about configuring security protocols for listeners, see the following sections of the Elastic Load Balancing User Guides: [Create an HTTPS listener for your Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html) and [Create a listener for your Network Load Balancer.](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-listener.html)