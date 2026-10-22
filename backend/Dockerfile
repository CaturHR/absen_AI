FROM node:20-alpine

WORKDIR /app

# Salin package.json dan package-lock.json
COPY package*.json ./

# Install dependencies (production)
RUN npm ci --only=production

# Salin seluruh kode backend
COPY . .

# Buat folder penyimpanan uploads jika belum ada
RUN mkdir -p uploads/attendance uploads/faces uploads/leaves uploads/gallery

# Port Express API
EXPOSE 5000

CMD ["node", "server.js"]
