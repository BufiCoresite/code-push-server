FROM node:18-alpine

WORKDIR /app

# Uygulama dosyalarını kopyala
COPY . .

# Bağımlılıkları yükle
RUN npm install

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

# Port
EXPOSE 3000

# Başlat
CMD ["npm", "start"]
