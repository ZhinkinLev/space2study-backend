# Dockerfile (Backend)

# Use Alpine image
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies AND pm2
RUN npm install
RUN npm install -g pm2

# Copy the rest of the project code
COPY . .

# Command to run on container start
# 'pm2-runtime' keeps the container alive
CMD ["pm2-runtime", "npm", "--", "start"]