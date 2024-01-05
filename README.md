# Dockerfile for Hugo with Go on Ubuntu

This Dockerfile creates an image based on Ubuntu 22.04, tailored for running a Hugo site with Go support. It is designed to work with both x86_64 and ARM architectures.

## Overview

- **Base Image**: Ubuntu 22.04
- **Tools Installed**:
  - Git
  - Wget
  - Build-essential (compilation tools)
  - Go (Version 1.21.5)
  - Hugo (Version 0.121.1, Extended Version)

The Dockerfile automatically detects the CPU architecture (ARM or x86_64) and downloads the appropriate versions of Go and Hugo.

## Building the Docker Image

To build the Docker image, navigate to the directory containing the Dockerfile and run:

```
docker build -t your-image-name .
```


Option 2: You can build and push this image to your own docker hub

```
docker buildx build --platform linux/amd64,linux/arm64 -t yourname/hugo-server:latest --push .
```

## Running the Container
After building the image, run the container using:


```
docker run -p 1313:1313 your-image-name
```

This command maps port 1313 from the container to port 1313 on your host machine, allowing you to access the Hugo server.

## Using the Container

The container sets /hugo as the working directory.
Hugo server can be accessed through ```http://localhost:1313``` once the container is running.

