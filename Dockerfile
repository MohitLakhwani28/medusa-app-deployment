# Use the official Node.js image from the Docker Hub 
FROM node:18-alpine 
# Set the working directory in the container 
WORKDIR /usr/src/app 
# Copy package.json and package-lock.json 
COPY package*.json ./ 
# Install dependencies 
RUN npm install 
# Copy the rest of the application code 
COPY . . 
# Expose the port that Medusa runs on 
EXPOSE 7001
# Run database migrations 
RUN npx medusa migrations run 
# Start the Medusa application 
CMD ["npx", "medusa", "develop"] 
