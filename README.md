# OpenSSH Server with rsync

This Docker image extends the [LinuxServer.io openssh-server image](https://github.com/linuxserver/docker-openssh-server) to include rsync, enabling file synchronization capabilities.

## Prerequisites

- Docker installed on your system
- Docker Compose installed (optional, but recommended)

## Usage

### Docker Compose (recommended)

1. Clone this repository:
   ```
   git clone https://github.com/Don-Swanson/rsync-docker.git
   cd rsync-docker
   ```

2. Modify the `docker-compose.yml` file to set your preferred configuration:
   - Set a secure password or use public key authentication
   - Adjust timezone if needed
   - Configure port mapping

3. Build and start the container:
   ```
   docker-compose up -d
   ```

### Using Docker CLI

1. Build the image:
   ```
   docker build -t rsync-docker .
   ```

2. Run the container:
   ```
   docker run -d \
     --name=rsync-docker \
     -e PUID=1000 \
     -e PGID=1000 \
     -e TZ=America/New_York \
     -e PASSWORD_ACCESS=true \
     -e USER_PASSWORD=password \
     -e SUDO_ACCESS=true \
     -p 2222:2222 \
     -v ./config:/config \
     --restart unless-stopped \
     rsync-docker
   ```

## Default User

The default username is `linuxserver.io` unless modified with the `USER_NAME` environment variable.

## Using rsync with this container

Once the container is running, you can use rsync to transfer files to and from the container:

```bash
# Upload files to the container
rsync -avz -e "ssh -p 2222" /local/path linuxserver.io@hostname:/remote/path

# Download files from the container
rsync -avz -e "ssh -p 2222" linuxserver.io@hostname:/remote/path /local/path
```

## Environment Variables

| Environment Variable | Description | Default |
|---------------------|-------------|---------|
| PUID | User ID to run as | 1000 |
| PGID | Group ID to run as | 1000 |
| TZ | Set the timezone | UTC |
| PASSWORD_ACCESS | Set to true to allow password authentication | false |
| USER_PASSWORD | Password for the user | - |
| PUBLIC_KEY | SSH public key for authentication | - |
| SUDO_ACCESS | Set to true to allow sudo access | false |
| USER_NAME | Username for SSH login | linuxserver.io |

For a complete list of supported environment variables, refer to the [LinuxServer.io openssh-server documentation](https://github.com/linuxserver/docker-openssh-server).

## Security Considerations

- Change the default password in docker-compose.yml
- Consider using public key authentication instead of password authentication
- Limit SSH access using firewall rules if exposing to the internet
- Regularly update your container to get the latest security fixes 