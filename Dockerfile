FROM n8nio/n8n:latest

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# bring in deps manifest
COPY package.json /home/node/.n8n/package.json

USER node
WORKDIR /home/node/.n8n

# Make npm tolerant + ensure registry
RUN npm --version && node --version && \
    npm config set fund false && \
    npm config set audit false && \
    npm config set registry https://registry.npmjs.org/ && \
    npm config set legacy-peer-deps true

# Install (works on old/new npm)
# 1) If you later add a package-lock.json, npm ci is preferred.
# 2) Fallback to install with production-only deps.
RUN (npm ci --only=production --loglevel=verbose) || \
    (npm install --only=prod --loglevel=verbose)

# Let n8n auto-load
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
