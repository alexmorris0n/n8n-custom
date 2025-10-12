FROM n8nio/n8n:latest

USER root

# Create custom nodes directory
RUN mkdir -p /usr/local/lib/n8n-custom-nodes

# Install community nodes (do it in one command without changing WORKDIR)
RUN cd /usr/local/lib/n8n-custom-nodes && \
    npm install --legacy-peer-deps \
    n8n-nodes-instantly \
    n8n-nodes-missive && \
    chown -R node:node /usr/local/lib/n8n-custom-nodes

USER node

# Tell n8n where to find custom nodes
ENV N8N_CUSTOM_EXTENSIONS=/usr/local/lib/n8n-custom-nodes/node_modules
