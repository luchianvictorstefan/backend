# Base image for Node.js
FROM node:22-alpine AS base
# Install yarn globally
RUN npm install -g yarn typescript tsc-alias

# Dependencies stage
FROM base AS dependencies
WORKDIR /app
# Copy package.json and yarn.lock
COPY package.json yarn.lock ./
# Install dependencies
RUN yarn install

# Build stage
FROM base AS build
WORKDIR /app
# Copy code
COPY . .
# Copy dependencies from the dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules
# Build the application using yarn
RUN yarn build

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
