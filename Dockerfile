FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and lock file to install dependencies
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the default Next.js port
EXPOSE 3000

# Start the Next.js development server
CMD ["npm", "run", "dev"]