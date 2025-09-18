FROM n8nio/n8n:latest

USER node
WORKDIR /home/node/.n8n

COPY package.json ./
RUN npm install --production

WORKDIR /
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
