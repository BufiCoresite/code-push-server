FROM node:18-alpine

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

# Environment variables için .env dosyası oluştur
#RUN touch .env

# Uygulamayı başlat
CMD ["sh", "-c", "node -r dotenv/config ./bin/script/server.js"]