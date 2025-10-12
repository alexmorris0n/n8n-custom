FROM n8nio/n8n:latest

USER root

# Install pnpm (n8n's native package manager)
RUN npm install -g pnpm

# Install community nodes into n8n's node_modules
WORKDIR /usr/local/lib/node_modules/n8n
RUN pnpm install n8n-nodes-missive n8n-nodes-tally n8n-nodes-softr

# Fix ownership and permissions
RUN chown -R node:node /usr/local/lib/node_modules/n8n/node_modules

# Switch back to non-root user
USER node

# Set working directory back to default
WORKDIR /home/node

# Environment variables for node functions (if your workflows use Code nodes)
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
