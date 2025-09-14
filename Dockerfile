FROM n8nio/n8n:latest

USER root
WORKDIR /home/node/.n8n

COPY package.json .
RUN npm install --production && \
    chown -R node:node /home/node

USER node
WORKDIR /

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
