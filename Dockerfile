FROM node:22-alpine AS node

FROM node AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Final stage
FROM node AS final
RUN mkdir -p /app/dist
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/dist ./dist
EXPOSE 3000
ENTRYPOINT ["node", "./dist/src/index.js"]