FROM node:18-alpine

# Çalışma dizinini oluştur
WORKDIR /app

# Önce package.json dosyalarını kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Tüm proje dosyalarını kopyala
COPY . .

# Gerekli dizinleri oluştur
RUN mkdir -p /app/data /app/bin/script

# Derleme işlemi
RUN npm run build

# İzinleri ayarla
RUN chmod -R 755 /app/bin

# Environment dosyası oluştur
RUN touch .env

# Port
EXPOSE 3000

# Çalıştırma komutu
CMD ["sh", "-c", "NODE_ENV=production node -r dotenv/config /app/bin/script/server.js"]