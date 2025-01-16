FROM node:18-alpine

# Çalışma dizinini ayarla
WORKDIR /usr/src/app

# Package dosyalarını kopyala
COPY package*.json ./

# Bağımlılıkları yükle
RUN npm install

# Tüm kaynak kodları kopyala
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

# Port
EXPOSE 3000

# Başlat
CMD ["npm", "start"]
