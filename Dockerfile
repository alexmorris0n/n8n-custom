FROM n8nio/n8n:latest

USER root
RUN npm install -g n8n-nodes-instantly n8n-nodes-missive
USER node
