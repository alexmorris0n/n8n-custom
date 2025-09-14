FROM n8nio/n8n:latest

USER root
# Build tools in case any node pulls native deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

# Prepare n8n home
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node
WORKDIR /home/node/.n8n

# Install community nodes as LOCAL deps (not -g)
RUN npm init -y
RUN npm install --omit=dev \
    n8n-nodes-tallyso \
    n8n-nodes-missive \
    n8n-nodes-softr

# Let n8n know what to load (also useful on first boot)
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"

# (Optional) allow Function/Code nodes to require() external libs
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
