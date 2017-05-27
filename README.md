# docker-dockerauth
bussybox version of docker_auth - https://github.com/cesanta/docker_auth

## Environment variables
- **AUTH_SERVER** _default_ "/docker_auth/auth_server"
- **AUTH_CONFIG** _default_ "/config/auth_config.yml"
- **COMMON_NAME** _default_ ""

## Certificate
A certificate will be gerated (`/ssl/rootcertbundle.pem`) if there is none and _COMMON_NAME_ is set.
This cert can be used for docker token authentification.
E.g.:
```sh
docker run -v /config:/config -v /ssl:/ssl fentas/dockerauth:latest
```

## rootfs.tar
until: https://github.com/cesanta/docker_auth/issues/171

- https://github.com/progrium/busybox
