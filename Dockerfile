FROM n8nio/n8n:latest

USER root

# Install community nodes using npm (avoids pnpm store conflicts)
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install --legacy-peer-deps n8n-nodes-missive n8n-nodes-tally n8n-nodes-softr

# Fix ownership
RUN chown -R node:node /usr/local/lib/node_modules/n8n/node_modules

USER node

WORKDIR /home/node
