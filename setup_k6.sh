#!/bin/bash
set -ex

# k6'nın en son sürümünü GitHub'dan (veya uygun bir kaynaktan) indiriyoruz
# Sistem yetkisi gerekmez, sadece bulunduğumuz klasöre indiririz
curl -L https://github.com/grafana/k6/releases/download/v0.49.0/k6-v0.49.0-linux-amd64.tar.gz -o k6.tar.gz

# Arşivi açıyoruz
tar -xvzf k6.tar.gz

# Klasörün içindeki k6 dosyasını ana dizine alıyoruz
cp k6-v0.49.0-linux-amd64/k6 .

# Çalıştırma yetkisi veriyoruz
chmod +x k6