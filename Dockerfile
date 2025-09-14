FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# bring in the deps manifest
COPY package.json /home/node/.n8n/package.json
USER node
WORKDIR /home/node/.n8n

# install locally so n8n auto-loads them
RUN npm install --omit=dev

# let n8n know what’s there
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
