<h1 align="center"> Avail Light Client Node
  

## Sistem gereksinimleri:
NODE TİPİ | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Ubuntu 22  | 2          | 4         | 80  |
  

# Script ile kurulum

```
wget -O avail-light.sh https://raw.githubusercontent.com/CoinHuntersTR/Avail-Full-Node/main/avail-light.sh && chmod +x avail-light.sh && ./avail-light.sh
```

# Manuel Kurulum

```
sudo apt-get update -y && sudo apt-get upgrade -y
```
## Sistem Gereksinimlerini yüklüyoruz.
```
sudo apt install curl tar wget clang pkg-config protobuf-compiler libssl-dev jq build-essential protobuf-compiler bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y
```
## Rust Yükleyelim
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
```
## Binary Yükleyip kuruyoruz.
```
git clone https://github.com/availproject/avail-light.git
cd avail-light
wget -O config.yaml https://raw.githubusercontent.com/thenhthang/vinnodes/main/Avail/config.yaml
git checkout v1.7.3
cargo build --release
cp -r target/release/avail-light /usr/local/bin
```
## Servis Dosyasını oluşturalım
```
sudo tee /etc/systemd/system/availightd.service > /dev/null <<EOF
[Unit]
Description=Avail Light Client
After=network-online.target

[Service]
User=$USER
ExecStart=$(which avail-light) --config $HOME/avail-light/config.yaml --network goldberg
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
```
## Kayıt ve Servisi Çalıştıralım
```
sudo systemctl daemon-reload
```
```
sudo systemctl enable availightd
```
```
sudo systemctl restart availightd
```
## Log Kayıtları ve İzleme
### Log kayıtlarını görmek için aşağıdaki komutları kullanabilirsiniz.
```
journalctl -u availd -fo cat
```
### Light Client gerekli diğer komutlar
```
curl "http://localhost:7000/v1/latest_block"
```
```
curl "http://localhost:7000/v1/confidence/1"
```
```
curl "http://localhost:7000/v1/appdata/1?decode=true"
```
```
curl "localhost:7000/v1/status"
```
```
curl "localhost:7000/v1/latest_block"
```
```
curl -I "localhost:7000/health"
```

## ÖNEMLİ NOT;
Light Node Başvuru Formu : [BURADAN](https://docs.google.com/forms/d/e/1FAIpQLSeL6aXqz6vBbYEgD1cZKaQ4vwbN2o3Rxys-wKTuKySVR-oS8g/viewform) formu doldurmayı unuatmayın.
