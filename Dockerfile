# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Install Python for building some npm packages
RUN apt-get update && apt-get install -y python3

# Copy the package.json and yarn.lock files to the working directory
COPY package.json ./ 
# yarn.lock ./

# Install dependencies using Yarn
RUN yarn install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
#RUN yarn build

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the application
CMD ["yarn", "run", "serve"]

