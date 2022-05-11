[![Build Status](https://drone.chrispruitt.io/api/badges/chrispruitt/dev-sandbox/status.svg)](https://drone.chrispruitt.io/chrispruitt/dev-sandbox)

# chrispruitt dev sandbox

This repo contains common tools and plugins I use when developing remotely.

## Usage

Quickstart:

```bash
docker run --security-opt="apparmor=unconfined" --cap-add=SYS_PTRACE -p 8080:8080 -v $PWD:/home/sandbox/workspaces chrispruitt/dev-sandbox:latest
```

When running as a service, consider mapping the following volumes for a generally better experience:

- /home/sandbox/.ssh - SSH auth
- /home/sandbox/workspaces - persistent workspaces
- /var/run/docker.sock - access to the docker daemon

## Environment Variables

- HISTFILE - path to your persistant history file
- ENTRYPOINT_HOOKS - custom startup scripts
