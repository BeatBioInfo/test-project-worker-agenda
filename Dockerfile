# Use Node.js official image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy source code
COPY . .

# Set environment variables for MongoDB
ENV MONGO_URL=mongodb://mongo:27017/agendaDB

# Expose a port (if applicable)
EXPOSE 3000

# Start the application
CMD ["node", "example/simple.js"]
