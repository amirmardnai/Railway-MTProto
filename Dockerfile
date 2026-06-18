FROM python:3.9-slim-bookworm

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# دانلود V2Ray نسخه 4.45 (که به طور کامل از MTProto پشتیبانی می‌کند)
RUN wget https://github.com/v2fly/v2ray-core/releases/download/v4.45.2/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip v2ray && \
    mv v2ray /usr/local/bin/v2ray && \
    chmod +x /usr/local/bin/v2ray && \
    rm v2ray-linux-64.zip

WORKDIR /app
COPY panel.py .

CMD ["python", "panel.py"]
