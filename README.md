<h1 align="center"> Avail Node Rehberi
  
![image](https://pbs.twimg.com/profile_banners/1508458204866486283/1687262602/1500x500)

## Sistem gereksinimleri:
### Ubunutu 22.04
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
cd
sudo mkdir /root/avail-node/
```
```
cd /root/avail-node/
```
```
wget https://github.com/availproject/avail/releases/download/v1.8.0.4/x86_64-ubuntu-2204-data-avail.tar.gz
```
```
tar xvzf x86_64-ubuntu-2204-data-avail.tar.gz
```

* coinhunters yazısını değiştirmeyi unutmayın.
```
sudo tee /etc/systemd/system/availd.service > /dev/null <<'EOF'
[Unit]
Description=Avail Validator
After=network.target
StartLimitIntervalSec=0

[Service]
User=root
Type=simple
Restart=always
RestartSec=120
ExecStart=/root/avail-node/data-avail -d /root/avail-node/data --chain goldberg --port 30333 --validator --name "coinhuntetrs"

[Install]
WantedBy=multi-user.target
EOF
```
```
sudo systemctl daemon-reload
```
```
sudo systemctl enable availd.service
```
```
sudo systemctl restart availd.service
```
### Durum kontrolü için;

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
Yukarıdaki adımları tamamladıktan sonra [BURADAN](https://telemetry.avail.tools/#list/0xd12003ac837853b062aaccca5ce87ac4838c48447e41db4a3dcfb5bf312350c6) kendi node'unuzu bulmanız gerekiyor. Ağ ile senkronize olduktan sonra, alttaki formu doldurmayı unutmayın.
[BURADAN](https://docs.google.com/forms/d/e/1FAIpQLScvgXjSUmwPpUxf1s-MR2C2o5V79TSoud1dLPKVgeLiLFuyGQ/viewform) formu doldurarak, işlemi tamamlıyoruz.

Light Node Başvuru Formu : [BURADAN](https://docs.google.com/forms/d/e/1FAIpQLSeL6aXqz6vBbYEgD1cZKaQ4vwbN2o3Rxys-wKTuKySVR-oS8g/viewform) Full Node dışında light Node içinde başvuru yapabilirsiniz. 
