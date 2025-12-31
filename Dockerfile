FROM alpine:latest

# Cài đặt xray/v2ray core
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && curl -L -H "Cache-Control: no-cache" -o /usr/bin/xray https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /usr/bin/xray -d /usr/bin \
    && chmod +x /usr/bin/xray

# Copy cấu hình vào máy ảo
COPY config.json /etc/xray/config.json

# Lệnh chạy server
CMD /usr/bin/xray -c /etc/xray/config.json
