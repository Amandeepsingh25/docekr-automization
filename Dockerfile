# Use the official Node.js slim image based on Alpine Linux
FROM node:alpine AS builder

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy application source code
COPY . .

# Build the application
RUN npm run build

# Use a lightweight base image for the final runtime image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy built files from the builder stage
COPY --from=builder /usr/src/app .

# Expose the port that the application will run on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
