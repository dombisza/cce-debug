FROM alpine:3.19.1 
LABEL org.opencontainers.image.authors="Open Telekom Cloud <szabolcs-andras.dombi@t-systems.com> <dombisza@gmail.com>"
LABEL org.opencontainers.image.description="debug container"
LABEL org.opencontainers.image.title="cce debug"
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.base.name="alpine:3.19.1"
LABEL org.opencontainers.image.docker.cmd="docker run -it ${image_name}"
LABEL org.opencontainers.image.docker.build.cmd="docker build --no-cache=true --tag ${image_name} ."

ENV CERT_PKG="ca-certificates openssl"
ENV GENERIC_PKG="bash bash-completion tmux tree"
ENV NETWORK_PKG="nmap tcpdump iperf3 tcptraceroute iputils bind-tools curl wget"
ENV CODE_PKG="vim git jq make"
ENV DEBUG_PKG="htop stress-ng strace"

ENV KUBECTL_V="v1.26.14"

RUN apk update && \
    apk add --no-cache \
    ${CERT_PKG} \
    ${GENERIC_PKG} \
    ${NETWORK_PKG} \
    ${CODE_PKG} \
    ${DEBUG_PKG}

RUN curl -LO "https://dl.k8s.io/release/${KUBECTL_V}/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/bin/bash"]
