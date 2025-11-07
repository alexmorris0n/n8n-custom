FROM n8nio/n8n:1.114.3

USER node

# Install community nodes in n8n's expected location
RUN mkdir -p /home/node/.n8n/nodes && \
    cd /home/node/.n8n/nodes && \
    npm install \
    n8n-nodes-instantly \
    n8n-nodes-missive
