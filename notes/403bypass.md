# 403 Bypass
When you get at `403` authentication required error, in a surprising amount of cases the server is misconfigured and with some simple techniques you can easily bypass the protections.

## Automation
You can use [our custom script](../scripts/403bypass.sh) which uses curl to brute force ~250 different bypasses.

All you need to do is copy and run the script supplying a target with `-u`:
```shell
./403bypass.sh -u www.target.com/target
```

It may generate a lot of traffic but it only reports successful bypasses. It'll print `Finished` when done.

## Change Request Method
Change the request method from `GET`. For example:

- GET to POST
- GET to TRACE
- GET to OPTIONS
- ect.

## Change Request Headers
Similar to changing the request method you can also try adding or modifying the following headers.

- Content-Length: 0
- X-rewrite-url
- X-Original-URL
- X-Custom-IP-Authorization
- X-Forwarded-For

## Rewrite URL
Another simple technique is to slightly modify the URL.

- xyz.com/secret/*
- xyz.com/secret/./
- xyz.com/%2f/secret/
- xyz.com/%2e/secret/
