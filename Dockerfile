FROM node:18.20.4-alpine

# Set working directory
WORKDIR /app

# Copy the application code
COPY  /apps/site/.next ./.next
COPY  /apps/site/public ./public
COPY  package*.json ./

# Expose port
EXPOSE 3000

# Start the application
CMD ["npx", "turbo", "dev"]
