import os
import json
import subprocess
import secrets

port = int(os.environ.get("PORT", 8080))
default_secret = secrets.token_hex(16)
secret = os.environ.get("MTPROTO_SECRET", default_secret)

config = {
    "inbounds": [
        {
            "port": port,
            "listen": "0.0.0.0",
            "protocol": "mtproto",
            "settings": {
                "users": [{"secret": secret}]
            }
        }
    ],
    "outbounds": [{"protocol": "freedom"}]
}

with open("config.json", "w") as f:
    json.dump(config, f, indent=2)

print(f"=========================================")
print(f"Starting Xray MTProto proxy on port {port}")
print(f"Secret: {secret}")
print(f"=========================================")

subprocess.run(["xray", "-c", "config.json"])
