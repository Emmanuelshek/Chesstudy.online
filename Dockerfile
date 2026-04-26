# Use Node 18
FROM node:18 AS build

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# -----------------------------
# Production image
# -----------------------------
FROM node:18

WORKDIR /app

# Copy everything from build stage
COPY --from=build /app /app

ENV PORT=8080
EXPOSE 8080

CMD ["node", "index.js"]
