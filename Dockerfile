FROM node:18.20.4-alpine

# Set working directory
WORKDIR /app

# Copy the application code
COPY . .
RUN npm install 
RUN npm run build

# Expose port
EXPOSE 3000

# Start the application
CMD ["npx", "turbo", "dev"]
