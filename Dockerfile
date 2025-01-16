FROM node:18-alpine as builder

# Çalışma dizinini ayarla
WORKDIR /app

# Package dosyalarını kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Kaynak kodları kopyala
COPY . .

# Config dosyası oluştur
RUN mkdir -p ./config && \
    echo '{\
    "production": {\
        "serverUrl": "http://codepush-server:3000",\
        "authorization": "Basic Y29kZXB1c2gxMjM0NTY="\
    }\
}' > ./config/config.json

# Build
RUN npm run build

# Çalışma aşaması
FROM node:18-alpine

WORKDIR /app

# Build dosyalarını kopyala
COPY --from=builder /app/build ./build
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/config ./config

# Sadece production bağımlılıklarını yükle
RUN npm install --production

# Port
EXPOSE 3000

# Başlat
CMD ["npm", "start"]
