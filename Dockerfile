FROM alpine:latest

# En son PocketBase sürümü (Haziran 2025 itibariyle)
ARG PB_VERSION=0.22.8

# Gerekli araçları yükleyin
RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

# PocketBase'i indirin ve kurun
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && chmod +x /pocketbase \
    && rm pocketbase_${PB_VERSION}_linux_amd64.zip

# Veri klasörünü oluşturun
RUN mkdir /pb_data

# Portu açın
EXPOSE 8090

# PocketBase'i çalıştırın
CMD ["/pocketbase", "serve", "--http=0.0.0.0:8090"]