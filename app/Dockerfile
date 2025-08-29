# Use official Node.js LTS image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app source code
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Start the app
CMD [ "npm", "start" ]