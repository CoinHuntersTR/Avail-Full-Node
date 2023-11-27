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

## Sistem Dosyalarını oluşturuyoruz.

```
touch /etc/systemd/system/availd.service
nano /etc/systemd/system/availd.service
```

Aşağıdaki kodda "adiniz" olan yere validatör adınızı girin. Kodu yapıştırdıktan sonra CTRL X-Y Enter ile çıkın.

```
[Unit] 
Description=Avail Light Client
After=network.target
StartLimitIntervalSec=0
[Service] 
User=root 
ExecStart=/root/avail-light/avail-light --network goldberg
Restart=always 
RestartSec=120
[Install] 
WantedBy=multi-user.target

```
```
systemctl enable availd.service
```
```
systemctl start availd.service
```
```
systemctl status availd.service
```
![ekran2](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/ec63219a-9b14-4a28-9502-6e801f3b0458)

Log kayıtlarını görmek için aşağıdaki komutları kullanabilirsiniz.
```
journalctl -f -u availd
```


## ÖNEMLİ NOT;
Light Node Başvuru Formu : [BURADAN](https://docs.google.com/forms/d/e/1FAIpQLSeL6aXqz6vBbYEgD1cZKaQ4vwbN2o3Rxys-wKTuKySVR-oS8g/viewform) formu doldurmayı unuatmayın.
