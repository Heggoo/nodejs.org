FROM node:18.20.4-alpine

# Set working directory
WORKDIR /app

# Copy the application code
COPY apps/site/.next/ .next/
COPY apps/site/public/ public/
COPY node_modules/ node_modules/
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY turbo.json turbo.json

# Expose port
EXPOSE 3000

# Start the application
CMD ["npx", "turbo", "dev"]
