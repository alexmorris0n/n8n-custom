FROM n8nio/n8n:latest

# Prepare ~/.n8n and make sure 'node' owns it
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Write a minimal package.json (avoids `npm init -y`)
RUN sh -lc 'cat > /home/node/.n8n/package.json <<EOF
{
  "name": "n8n-community-nodes",
  "private": true,
  "description": "Pinned community nodes for n8n",
  "license": "UNLICENSED",
  "dependencies": {
    "n8n-nodes-tallyso": "^1.0.0",
    "n8n-nodes-missive": "*",
    "n8n-nodes-softr": "*"
  }
}
EOF'

USER node
WORKDIR /home/node/.n8n

# Install locally under ~/.n8n (what n8n expects)
RUN npm install --omit=dev

# Let n8n auto-load them (nice-to-have)
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV N8N_COMMUNITY_PACKAGES="n8n-nodes-tallyso,n8n-nodes-missive,n8n-nodes-softr"
# Optional: allow require() in Function/Code nodes
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

WORKDIR /
