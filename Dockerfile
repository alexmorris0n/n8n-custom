FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Copy in your package.json
COPY package.json /home/node/.n8n/package.json

USER node
WORKDIR /home/node/.n8n

# Install the community nodes listed in package.json
RUN npm install --omit=dev

# Environment vars so n8n knows to load them
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
