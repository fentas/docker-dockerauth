#!/bin/sh

AUTH_SERVER=${AUTH_SERVER:-"/docker_auth/auth_server"}
AUTH_CONFIG=${AUTH_CONFIG:-"/config/auth_config.yml"}

# Generate self-signed certificate, if required.
if [ ! -f /ssl/rootcertbundle.pem ] && [ -n "${COMMON_NAME}" ]; then
  mkdir -p /ssl
  openssl req -x509 -newkey rsa:2048 -nodes -days 365 -keyout /ssl/rootcertbundle.key -out /ssl/rootcertbundle.pem -sha256 -subj "/CN=$COMMON_NAME"
fi

exec ${AUTH_SERVER} --v=2 --alsologtostderr "${AUTH_CONFIG}"
