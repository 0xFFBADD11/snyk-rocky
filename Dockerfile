FROM docker.io/rockylinux/rockylinux:9.1
LABEL maintainer="Rob"

RUN dnf upgrade
RUN dnf install tzdata
ENV TZ="America/Chicago"

# Ensure the termination happens on container stop, cgroup, starting init
STOPSIGNAL SIGRTMIN+3
CMD ["/usr/sbin/init"]
