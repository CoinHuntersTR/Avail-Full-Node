<h1 align="center"> Avail Node Rehberi
  
![image](https://pbs.twimg.com/profile_banners/1508458204866486283/1687262602/1500x500)

## Sistem gereksinimleri:
NODE TİPİ | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Avail  | 2          | 4         | 80  |
  

# Kurulum

```
sudo apt-get update -y && sudo apt-get upgrade -y
```

```
sudo apt install make clang pkg-config libssl-dev build-essential git screen protobuf-compiler -y
```
```
curl https://sh.rustup.rs -sSf | sh
```
```
source $HOME/.cargo/env
```
```
rustup update nightly
```
```
rustup target add wasm32-unknown-unknown --toolchain nightly
```
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
Yukarıdaki adımları tamamladıktan sonra [BURADAN](https://telemetry.avail.tools/#list/0xd12003ac837853b062aaccca5ce87ac4838c48447e41db4a3dcfb5bf312350c6) kendi node'unuzu bulmanız gerekiyor. Ağ ile senkronize olduktan sonra, alttaki formu doldurmayı unutmayın.
[BURADAN](https://docs.google.com/forms/d/e/1FAIpQLScvgXjSUmwPpUxf1s-MR2C2o5V79TSoud1dLPKVgeLiLFuyGQ/viewform) formu doldurarak, işlemi tamamlıyoruz.
