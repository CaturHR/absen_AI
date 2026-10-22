# Stage 1: Build Frontend
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Stage 2: Serve dengan Nginx
FROM nginx:alpine

# Salin hasil build Vite
COPY --from=builder /app/dist /usr/share/nginx/html

# Salin konfigurasi Nginx reverse proxy
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
