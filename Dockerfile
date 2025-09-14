FROM n8nio/n8n:latest

# Install community nodes
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --omit=dev \
        n8n-nodes-tally \
        n8n-nodes-missive \
        n8n-nodes-softr

# Enable community packages
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
