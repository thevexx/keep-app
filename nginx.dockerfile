FROM node:latest as node
WORKDIR /app
COPY package.json package.json
RUN npm install
COPY . .
RUN npm run build -- --prod
##### Stage 2
FROM node:latest
WORKDIR /app
COPY --from=node /app/dist /app
RUN node server.js
