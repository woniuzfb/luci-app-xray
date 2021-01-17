# Container image that runs your code
FROM openwrtorg/sdk:aarch64_generic-snapshot

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY build.sh /build.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/build.sh"]
