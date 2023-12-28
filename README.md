# xademy-hugo-server

his Dockerfile is designed to create a Docker image based on Ubuntu 22.04 that includes Git, Go, and Hugo, specifically configured for ARM architecture (like that of an M1 Mac or other ARM-based systems). Here's a breakdown of what each part of the Dockerfile does:

Base Image

FROM ubuntu:22.04: This line specifies that the base image for your Docker image is Ubuntu 22.04. It's an official Ubuntu image suitable for ARM architectures.
Environment Variable for apt

ENV DEBIAN_FRONTEND=noninteractive: Sets an environment variable to prevent apt (the package manager) from asking interactive questions during the installation process.
Installing Dependencies

RUN apt-get update && apt-get install -y git wget build-essential: Updates the package lists from the repositories and installs git (version control system), wget (a utility for downloading files from the web), and build-essential (a package that includes a compiler and related tools necessary for building software).
Installing Go

RUN wget https://go.dev/dl/go1.21.5.linux-arm64.tar.gz ...: Downloads and installs Go (version 1.21.5, for ARM64 architecture). The binary is extracted into /usr/local, and the tarball is removed after installation.
ENV PATH="${PATH}:/usr/local/go/bin": Updates the PATH environment variable to include the Go binary directory. This allows you to run Go commands in the Docker container.
Installing Hugo

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_extended_0.121.1_linux-arm64.deb ...: Downloads the Hugo static site generator (extended version 0.121.1, compatible with ARM64 architecture) and installs it using dpkg. The Debian package file is removed after installation.
Setting Working Directory

WORKDIR /hugo: Sets the working directory inside the Docker container to /hugo. This is where you would typically mount your Hugo project from your host machine.
Exposing Ports

EXPOSE 1313: Exposes port 1313, which is the default port used by Hugo for its web server.
Default Command

CMD ["hugo", "server", "--bind", "0.0.0.0"]: Specifies the default command to run when the container starts. This command starts the Hugo server and configures it to listen on all network interfaces within the container.
When you build and run a container using this Dockerfile, it will start a Hugo server ready to serve your static site. This setup is particularly useful for development environments where you want to work with Hugo on an ARM-based system.