FROM n8nio/n8n:latest

USER root

# Install community nodes globally
RUN npm install -g \
    n8n-nodes-tally \
    n8n-nodes-missive \
    n8n-nodes-softr && \
    ln -s /usr/local/lib/node_modules/n8n-nodes-* /usr/local/lib/node_modules/n8n/node_modules/ 2>/dev/null || true

USER node

# Enable community packages
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
