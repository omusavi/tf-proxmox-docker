# tf-proxmox-docker

Repo demonstrating a possible bug in the proxmox terraform provider when running in docker. I have reproed this using
devcontainers as well as bare Dockerfiles.

When running the same terraform module outside of Docker, the image is successfully uploaded

## Pre-requisites

- Docker CE

## Repro Steps

1. Run `docker build . -t tf-proxmox-docker`
2. Run `docker run -it tf-proxmox-docker`
3. Fill in terraform variables to point to your proxmox server
4. Type `yes` to apply

Expected:
Ubuntu image is uploaded to local storage (usually takes less than 2 minutes)

Actual:
Times out after 15 minutes, no file is ever created

**Note:** outside of the docker image, the same terraform code completes successfully!
