FROM n8nio/n8n:latest

# Ensure ~/.n8n exists and is owned by node
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node/.n8n

# Install as local deps so n8n auto-loads them
RUN npm init -y
RUN npm install --omit=dev \
  n8n-nodes-tallyso \
  n8n-nodes-missive \
  n8n-nodes-softr

# Tell n8n what’s installed (nice-to-have)
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"

# If you need require() in Function/Code nodes
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
