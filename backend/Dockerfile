# Use Node.js 20 Alpine
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy backend source code
COPY . .

# Application port
EXPOSE 8080

# Start the application
CMD ["node", "server.js"]