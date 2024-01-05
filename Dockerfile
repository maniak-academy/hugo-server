# Use Ubuntu as the base image
# Ensure the tag is compatible with ARM architecture
FROM ubuntu:22.04

# Update and install Git and other necessary tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    git \
    wget \
    build-essential

ENV GO_VERSION 1.21.5
ENV HUGO_VERSION 0.121.1

# Install Go and Hugo with correct CPU architecture.
RUN if [ "$(uname -m)" = "x86_64" ]; then \
		go_url="https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz"; \
		hugo_url="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"; \
	else \
		go_url="https://go.dev/dl/go${GO_VERSION}.linux-arm64.tar.gz"; \
		hugo_url="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-arm64.tar.gz"; \
	fi; \
	wget -O go.tar.gz "$go_url" && \
	wget -O hugo.tar.gz "$hugo_url" && \
	tar -C /usr/local -zxf go.tar.gz && \
	tar -C /usr/local/bin -zxf hugo.tar.gz && \
	rm -f go.tar.gz hugo.tar.gz && \
	mkdir -p /hugo

ENV PATH="${PATH}:/usr/local/go/bin"

# Set the working directory
WORKDIR /hugo

# Expose the default Hugo port
EXPOSE 1313

# Command to start Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0"]
