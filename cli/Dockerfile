# Node.js base image
FROM node:18-alpine

# Çalışma dizinini oluştur
WORKDIR /app

# package.json dosyasını kopyala
# cli/ yerine ./ kullanıyoruz çünkü Dockerfile zaten cli klasöründe
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Tüm kaynak kodlarını kopyala
# cli/ yerine ./ kullanıyoruz
COPY . .

# TypeScript'i derle
RUN npm run build

# Global olarak CLI'ı yükle
RUN npm install -g .

# Çalışma dizinini oluştur
RUN mkdir -p /app/data

# Başlangıç komutu
CMD ["sh", "-c", "code-push login ${CODEPUSH_SERVER_URL} --accessKey ${ACCESS_KEY} && tail -f /dev/null"]