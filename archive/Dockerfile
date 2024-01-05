# Syntax to use Docker Buildx build arguments
ARG TARGETARCH

# Use an official base image
FROM ubuntu

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Git and other necessary tools
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential

# Conditional installation for amd64 and arm64
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        apt-get install -y golang hugo; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        wget https://go.dev/dl/go1.21.5.linux-arm64.tar.gz \
        && tar -xvf go1.21.5.linux-arm64.tar.gz \
        && mv go /usr/local \
        && rm go1.21.5.linux-arm64.tar.gz; \
        wget https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_extended_0.121.1_linux-arm64.deb \
        && dpkg -i hugo_extended_0.121.1_linux-arm64.deb \
        && rm hugo_extended_0.121.1_linux-arm64.deb; \
    fi

# Setup working directory
WORKDIR /hugo

# Expose default Hugo port
EXPOSE 1313

# Set default command to start Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0"]
