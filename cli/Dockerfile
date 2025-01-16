# Node.js base image
FROM node:18-alpine

# Çalışma dizinini oluştur
WORKDIR /app

# CLI kaynak kodlarını kopyala
COPY cli/package*.json ./

# Bağımlılıkları yükle
RUN npm install

# CLI kodlarını kopyala
COPY cli/ .

# TypeScript'i derle
RUN npm run build

# Global olarak CLI'ı yükle
RUN npm install -g .

# Çalışma dizinini oluştur
RUN mkdir -p /app/data

# Başlangıç komutu
CMD ["sh", "-c", "code-push login ${CODEPUSH_SERVER_URL} --accessKey ${ACCESS_KEY} && tail -f /dev/null"]