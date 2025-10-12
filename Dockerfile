FROM n8nio/n8n:latest

USER root

# Create custom nodes directory
RUN mkdir -p /usr/local/lib/n8n-custom-nodes

# Install community nodes in custom location
WORKDIR /usr/local/lib/n8n-custom-nodes
RUN npm install --legacy-peer-deps \
    n8n-nodes-instantly \
    n8n-nodes-missive

# Fix ownership
RUN chown -R node:node /usr/local/lib/n8n-custom-nodes

USER node

WORKDIR /home/node

# Tell n8n where to find custom nodes
ENV N8N_CUSTOM_EXTENSIONS=/usr/local/lib/n8n-custom-nodes/node_modules
