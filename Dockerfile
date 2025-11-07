FROM n8nio/n8n@sha256:fa410b71ccb5ddee9f9e4b25a964fbc8fcf56744d5f24dc4d2b8b414ae76ee26

USER node

# Install community nodes in n8n's expected location
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install \
    n8n-nodes-instantly \
    n8n-nodes-missive
