FROM docker.io/rockylinux/rockylinux:latest-minimal
LABEL maintainer="Rob"

ENV TZ="America/Chicago"

ENV update='microdnf upgrade'
ENV install='microdnf install'

RUN $update && $install \
    tzdata \
    sudo

# Ensure the termination happens on container stop, cgroup, starting init
STOPSIGNAL SIGRTMIN+3
CMD ["/usr/sbin/init"]
