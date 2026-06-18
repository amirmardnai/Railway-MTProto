FROM python:3.9-slim-bookworm

RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/XTLS/Xray-core/releases/download/v1.8.24/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip xray && \
    mv xray /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray && \
    rm Xray-linux-64.zip

WORKDIR /app
COPY panel.py .

CMD ["python", "panel.py"]
