FROM n8nio/n8n:latest

USER root

# Create directory for community nodes if it doesn't exist
RUN mkdir -p /home/node/.n8n/nodes

# Install community nodes globally and copy to n8n's custom nodes directory
RUN npm install -g n8n-nodes-tally n8n-nodes-missive n8n-nodes-softr && \
    cp -r /usr/local/lib/node_modules/n8n-nodes-* /home/node/.n8n/nodes/ 2>/dev/null || true && \
    chown -R node:node /home/node/.n8n/nodes

USER node

# Enable community packages
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
