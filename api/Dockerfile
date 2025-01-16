# Node.js base image
FROM node:18-alpine

# Çalışma dizinini oluştur
WORKDIR /app

# Package dosyalarını kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Tüm kaynak kodları kopyala
COPY . .

# TypeScript'i derle
RUN npm run build

# Port'u aç
EXPOSE 3000

# Uygulamayı başlat
CMD ["npm", "run", "start:env"]