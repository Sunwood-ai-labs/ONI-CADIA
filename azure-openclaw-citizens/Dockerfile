FROM ghcr.io/openclaw/openclaw:2026.4.5

USER root
COPY state/ /opt/oni-cadia-openclaw-state/
COPY entrypoint.sh /usr/local/bin/oni-cadia-openclaw-entrypoint
RUN chmod +x /usr/local/bin/oni-cadia-openclaw-entrypoint \
  && chown -R node:node /opt/oni-cadia-openclaw-state
USER node

ENTRYPOINT ["/usr/local/bin/oni-cadia-openclaw-entrypoint"]
