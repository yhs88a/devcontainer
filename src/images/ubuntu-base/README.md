# ubuntu-base

![Build status](https://github.com/yhs88a/devcontainer/actions/workflows/build-push-ubuntu-base.yml/badge.svg)
![Licence: MIT](https://img.shields.io/github/license/yhs88a/devcontainer)

## Description

`ubuntu-base` Docker image. It is maintained and published under the `yhs88a` Amazon ECR Public Gallery account.

[https://gallery.ecr.aws/yhs88a/devcontainer/ubuntu-base](https://gallery.ecr.aws/yhs88a/devcontainer/ubuntu-base)

## Docker Image

- **Image Name**: `ubuntu-base`
- **Group**: `devcontainer`
- **Docker Hub Username**: `yhs88a`
- **Supported Platforms**: `linux/amd64,linux/arm64`
- **Base Image**: `ubuntu`

## Tags

The Docker image is tagged as follows:

```
"public.ecr.aws/${OWNER}/${GROUP}/${FILE}",
"public.ecr.aws/${OWNER}/${GROUP}/${FILE}:${TAG}",
```

## Usage

To pull and run the Docker image, use the following commands:

```bash
# Pull the image
docker pull public.ecr.aws/yhs88a/devcontainer/ubuntu-base:latest

# Run the image
docker run --name <container_name> -d public.ecr.aws/yhs88a/devcontainer/ubuntu-base:latest
```
