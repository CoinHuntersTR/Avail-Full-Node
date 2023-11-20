<h1 align="center"> Avail Light Client Node
  

## Sistem gereksinimleri:
NODE TİPİ | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Avail  | 2          | 4         | 80  |
  

# Kurulum

```
sudo apt-get update -y && sudo apt-get upgrade -y
```

```
sudo apt install make clang pkg-config libssl-dev build-essential
```
```
mkdir -p ${HOME}/avail-light
```
```
wget https://github.com/availproject/avail-light/releases/download/v1.7.3/avail-light-linux-amd64.tar.gz
```
```
tar -xvzf avail-light-linux-amd64.tar.gz
cp avail-light-linux-amd64 avail-light
```
```
./avail-light --network goldberg
```
![ekran1](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/e00af19d-f18d-45b2-b51f-810098f8b171)

```
git clone https://github.com/availproject/avail.git
```

```
screen -S avail
```
```
cd avail
```
```
cargo build --release -p data-avail
```
```
mkdir -p output
```
```
git checkout v1.7.2
```
```
cargo run --locked --release -- --chain kate -d ./output
```
### Çıktı sonrasında CTRL+C basarak durduruyoruz.

```
sudo touch /etc/systemd/system/availd.service
```
```
sudo nano /etc/systemd/system/availd.service
```
Aşağıdaki kodda "adiniz" olan yere validatör adınızı girin. Kodu yapıştırdıktan sonra CTRL X-Y Enter ile çıkın.

```
[Unit]
Description=Avail Validator
After=network.target
StartLimitIntervalSec=0
[Service]
User=root
ExecStart= /root/avail/target/release/data-avail --base-path `pwd`/data --chain kate --name "adiniz"
Restart=always
RestartSec=120
[Install]
WantedBy=multi-user.target
```
```
sudo systemctl start availd.service
```
```
sudo systemctl status availd.service
```
### "Role" bölümünde "FULL NODE" ve "Node Name" bölümünde adınızı görüyorsanız. Sorunsuz şekilde kurulmuş demektir.

Log kayıtlarını görmek için aşağıdaki komutları kullanabilirsiniz.
```
journalctl -f -u availd
```
## System Durdurma için;
```
sudo systemctl stop availd.service
```
## ÖNEMLİ NOTLAR;
Light Node Başvuru Formu : [BURADAN](https://docs.google.com/forms/d/e/1FAIpQLSeL6aXqz6vBbYEgD1cZKaQ4vwbN2o3Rxys-wKTuKySVR-oS8g/viewform) Full Node dışında light Node içinde başvuru yapabilirsiniz. 
