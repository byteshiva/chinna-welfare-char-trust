FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

# Install all dependencies (including dev dependencies for development)
RUN npm install

COPY . .

EXPOSE 3000

# Use npm run dev which should be defined in your package.json
CMD ["npm", "run", "dev"]
