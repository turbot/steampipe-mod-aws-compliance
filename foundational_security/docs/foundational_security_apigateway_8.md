## Description

This control checks if Amazon API Gateway routes have an authorization type. The control fails if the API Gateway route does not specify an authorization type.

API Gateway supports multiple mechanisms for controlling and managing access to your API. By specifying an authorization type, you can restrict access to your API to only authorized users or processes.

## Remediation

To set an authorization type for HTTP APIs, see [Controlling and managing access to an HTTP API in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-access-control.html) in the API Gateway Developer Guide. To set an authorization type for WebSocket APIs, see [Controlling and managing access to a WebSocket API in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-control-access.html) in the API Gateway Developer Guide.