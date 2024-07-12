FROM node:22-alpine AS node

FROM node AS builder

WORKDIR /app
COPY package*.json ./
RUN npm i
RUN npm install -g typescript tsc-alias
COPY . .
RUN npm run build

# Final stage
FROM node AS final
# Prepare a destination directory for js files
RUN mkdir -p /app/dist
WORKDIR /app
COPY package*.json ./
RUN npm i --only=production
COPY --from=builder /app/dist ./dist
EXPOSE 3000
ENTRYPOINT ["node", "./dist/src/index.js"]