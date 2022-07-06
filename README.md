[![Build Status](https://drone.justmiles.io/api/badges/justmiles/dev-sandbox/status.svg)](https://drone.justmiles.io/justmiles/dev-sandbox)

# justmiles dev sandbox

This repo contains common tools and plugins I use when developing remotely.

## Usage

Quickstart:

```bash
docker run --privileged \
  -e TS_AUTH_KEY \
  -e TS_HOSTNAME \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 8080:8080 \
  -v $PWD:/home/sandbox/workspaces \
  -v $PWD/tailscaled:/var/lib/tailscaled \
  justmiles/dev-sandbox:latest
```

Use [Tailscale HTTPS](https://tailscale.com/kb/1153/enabling-https/)

```
docker run --privileged \
  -e TS_AUTH_KEY="tskey-xxxxxxxxxxxxxxxxxxxxxxxxxxx" \
  -e TS_HOSTNAME="my-dev-sandbox" \
  -e TS_SSL_ENABLED=true \
  -e TS_DOMAIN_ALIAS="tailnet-xxxx.ts.net" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD:/home/sandbox/workspaces \
  justmiles/dev-sandbox:latest
```

## Volumes

Consider mapping the following volumes for a generally better experience.

| Name                     | Description                     |
| ------------------------ | ------------------------------- |
| /home/sandbox/.ssh       | pass in your SSH credentials    |
| /home/sandbox/workspaces | working directory for IDE       |
| /var/run/docker.sock     | access to the docker daemon     |
| /dev/net/tun             | TUN/TAP for Tailscale & OpenVPN |

## Environment Variables

| Name             | Description                                                                                           | Default             |
| ---------------- | ----------------------------------------------------------------------------------------------------- | ------------------- |
| TS_SSL_ENABLED   | (required for TLS) serve code-server over HTTPS using tailscale certificates                          | false               |
| TS_DOMAIN_ALIAS  | (required for TLS) [tailscale domain alias](https://login.tailscale.com/admin/settings/features)      |                     |
| TS_AUTH_KEY      | tailscale authentication key                                                                          |                     |
| TS_HOSTNAME      | tailscale hostname for this machine                                                                   |                     |
| TS_EXTRA_ARGS    | additional arguments to the `tailscale up` command                                                    |                     |
| TS_STATE_DIR     | absolute path of tailscale state file                                                                 | /var/lib/tailscaled |
| HISTFILE         | path to your persistant history file                                                                  |                     |
| S6\_\*           | [s6-rc configuration options](https://github.com/just-containers/s6-overlay#customizing-s6-behaviour) |                     |
| ENTRYPOINT_HOOKS | path to directory of executables to be invoked before launching code-server                           |                     |

## Daemons

This project uses an s6-overlay to manage backend daemons.

| Name          | Description                              |
| ------------- | ---------------------------------------- |
| code-server   | the main IDE                             |
| tailscald     | tailscale daemon for mesh VPN            |
| TODO: openvpn | client VPN to access privileged networks |
