# Update 1.8.0.2 Goldberg Avail | validator

Güncelleme için öncelikle validator'ü [BURADAN](https://github.com/CoinHuntersTR/Avail-Full-Node/blob/main/README.md) kurulum işlemlerini tamamlamanız gerekiyor.

## Sistem gereksinimleri:
NODE TİPİ | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Avail  | 2          | 4         | 80  |
  
Şimdi Node'umuzu 1.8.0.2 versiyonuna güncelliyoruz.
# Güncelleme
```
screen -S avail
```
```
cd avail
```
```
git checkout v1.7.2
```
```
sudo systemctl stop availd.service
```
```
git pull
```
```
git checkout v1.8.0.2
```
```
cargo run --locked --release -- --chain goldberg -d ./output
```
```
sudo nano /etc/systemd/system/availd.service
```
Öncelikle açtığınız yerdeki tüm verileri CTRL+K yaparak siliyoruz. Sonra aşağıdaki kodda "adiniz" olan yere validatör adınızı girin. Kodu yapıştırdıktan sonra CTRL X-Y Enter ile çıkın.

```
[Unit]
Description=Avail Validator
After=network.target
StartLimitIntervalSec=0
[Service]
User=root
ExecStart= /root/avail/target/release/data-avail --base-path `pwd`/data --chain goldberg --name "adiniz"
Restart=always
RestartSec=120
[Install]
WantedBy=multi-user.target
```
```
sudo systemctl disable availd.service
```
```
sudo systemctl enable availd.service
```

```
systemctl daemon-reload
```
```
sudo systemctl start availd.service
```
Node Durumunu kontrol ediyoruz.

```
sudo systemctl status availd.service
```

Log kayıtlarını kontrol etmek için
```
journalctl -f -u availd
```
Node durumunu [BURADAN](https://telemetry.avail.tools/#list/0x6f09966420b2608d1947ccfb0f2a362450d1fc7fd902c29b67c906eaa965a7ae) kontrol edebilirsiniz.
