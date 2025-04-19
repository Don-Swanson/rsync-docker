#!/bin/bash
set -e

echo "Building rsync-docker Docker image..."
docker build -t rsync-docker .

echo "Docker image built successfully! Use one of the following to run the container:"
echo ""
echo "Using Docker Compose:"
echo "docker-compose up -d"
echo ""
echo "Using Docker CLI:"
echo "docker run -d --name=rsync-docker -e PUID=1000 -e PGID=1000 -e TZ=America/New_York -e PASSWORD_ACCESS=true -e USER_PASSWORD=password -e SUDO_ACCESS=true -p 2222:2222 -v \$(pwd)/config:/config --restart unless-stopped rsync-docker" 