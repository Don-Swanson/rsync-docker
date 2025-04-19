FROM lscr.io/linuxserver/openssh-server:latest

LABEL maintainer="Don-Swanson"
LABEL description="OpenSSH server with rsync"

# Install rsync
RUN apk add --no-cache rsync

# Add message of the day to indicate this is a custom image with rsync
RUN echo "Welcome to OpenSSH Server with rsync" > /etc/motd 