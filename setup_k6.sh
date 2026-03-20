#!/bin/bash
set -ex

# 1. k6'nın Linux için hazır çalışan dosyasını indiriyoruz (Sistem yetkisi istemez)
curl -L https://github.com/grafana/k6/releases/download/v0.49.0/k6-v0.49.0-linux-amd64.tar.gz -o k6.tar.gz

# 2. Arşivi açıyoruz
tar -xvzf k6.tar.gz

# 3. Klasörün içindeki k6 dosyasını bulunduğumuz yere kopyalıyoruz
cp k6-v0.49.0-linux-amd64/k6 .

# 4. Dosyaya çalışma yetkisi veriyoruz
chmod +x k6