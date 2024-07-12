# Base image for Node.js
FROM node:22-alpine AS base
# Install pnpm globally
RUN npm i -g pnpm typescript tsc-alias

# Dependencies stage
FROM base AS dependencies
WORKDIR /app
# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./
# Install dependencies
RUN pnpm install

# Build stage
FROM base AS build
WORKDIR /app
# Copy code
COPY . .
# Copy dependencies from the dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules
# Build the application using pnpm
RUN tsc && tsc-alias
# Prune development dependencies
RUN pnpm prune --prod

# Deployment stage
FROM base AS deploy
WORKDIR /app
# Copy the built application
COPY --from=build /app/dist/ ./dist/
# Copy the production dependencies
COPY --from=build /app/node_modules ./node_modules
# Copy package.json (needed for "type": "module")
COPY package.json ./
# Run the application
CMD [ "node", "dist/src/index.js" ]