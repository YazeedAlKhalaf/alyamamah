# Use a temporary image for downloading and installing yq
FROM debian:buster-slim AS builder

RUN apt-get update \
    && apt-get install -y jq wget \
    && wget https://github.com/mikefarah/yq/releases/download/v4.34.2/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

# Your main image
FROM ghcr.io/processone/ejabberd:23.04

# Copy yq from the builder image
COPY --from=builder /usr/bin/yq /usr/bin/yq

# Copy configuration and entry script
COPY conf/ejabberd.yml /opt/ejabberd/conf/ejabberd.yml
COPY scripts/entrypoint.sh /home/entrypoint.sh

# Change permissions for the configuration file
RUN chmod +rw /opt/ejabberd/conf/ejabberd.yml

# Update ENTRYPOINT to use the custom script
ENTRYPOINT ["/sbin/tini", "--", "/home/entrypoint.sh"]
CMD ["foreground"]
