# Use Ubuntu as the base image
# Ensure the tag is compatible with ARM architecture
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install Git and other necessary tools
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential

# Install Go
# ENV GO_VERSION 1.18
# RUN wget https://golang.org/dl/go$GO_VERSION.linux-amd64.tar.gz && \
#     tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz && \
#     rm go$GO_VERSION.linux-amd64.tar.gz
# ENV PATH $PATH:/usr/local/go/bin

# # Install Hugo
# RUN wget https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_extended_0.121.1_Linux-64bit.tar.gz && \
#     tar -xzf hugo_extended_0.121.1_Linux-64bit.tar.gz && \
#     mv hugo /usr/local/bin/ && \
#     rm hugo_extended_0.121.1_Linux-64bit.tar.gz
 

#Install Go (the package manager should handle architecture compatibility)
RUN wget https://go.dev/dl/go1.21.5.linux-arm64.tar.gz \
    && tar -xvf go1.21.5.linux-arm64.tar.gz\
    && mv go /usr/local \
    && rm go1.21.5.linux-arm64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

# Install Hugo (ensure to download the ARM version)
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.121.1/hugo_extended_0.121.1_linux-arm64.deb \
    && dpkg -i hugo_extended_0.121.1_linux-arm64.deb \
    && rm hugo_extended_0.121.1_linux-arm64.deb

# Set the working directory
WORKDIR /hugo

# Expose the default Hugo port
EXPOSE 1313

# Command to start Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0"]
