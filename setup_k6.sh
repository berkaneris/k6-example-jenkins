#!/bin/bash
set -ex

# Jenkins konteyneri genellikle root yetkisiyle çalışır, sudo'ya gerek yoktur.
# Eğer sudo yüklü değilse, doğrudan komutları çalıştırıyoruz.

apt-get update
apt-get install -y gpg wget

# Eski anahtar ve depoları temizleyelim (opsiyonel ama sağlıklı)
rm -f /usr/share/keyrings/k6-archive-keyring.gpg

# Yeni resmi Grafana k6 anahtarını ekleyelim
wget -q -O - https://dl.k6.io/key.gpg | gpg --dearmor -o /usr/share/keyrings/k6-archive-keyring.gpg

# Resmi depoyu listeye ekleyelim
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list

# Listeyi güncelleyip k6'yı kuralım
apt-get update
apt-get install -y k6