<h1 align="center"> Madara & Karnot
  
![image](https://pbs.twimg.com/media/GEs4hlUXAAEf03M?format=jpg&name=large)

## Sistem gereksinimleri:
### Ubunutu 22.04
NODE TİPİ | CPU     | RAM      | SSD     |
| ------------- | ------------- | ------------- | -------- |
| Avail  | 4         | 8         | 160  |
  

# Kurulum

```
sudo apt-get update -y && sudo apt-get upgrade -y
```
### Rust Kuralım
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
1 seçip devam ediyoruz.
![Ekran görüntüsü 2024-01-25 231300](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/fcfb956e-ab50-4e9d-a957-41556e883f41)
```
source $HOME/.cargo/env
```
* Rust versionu kontrol edelim;

```
rustc --version
```
* versionumuz olarak bu çıkacak: rustc 1.75.0 (82e1608df 2023-12-21)

### Git kuruyoruz.
```
sudo apt install git
```
### Docker Kuruyoruz.
```
sudo apt install docker-ce
```

### Tekrar Güncelliyoruz.
```
sudo apt-get update -y && sudo apt-get upgrade -y
```
```
sudo apt install build-essential
```
```
sudo apt install pkg-config
```
```
sudo apt install libssl-dev
```
```
sudo apt install clang
```
```
sudo apt install protobuf-compiler
```

## MADARA Kuruyoruz;
```
git clone https://github.com/karnotxyz/madara-cli
```
```
cd madara-cli
```
```
cargo build --release
```
# Dikkat Komutu Girmeden önce alttaki görselleri ve açıklamaları okuyun.
```
./target/release/madara init
```
* Komutu başlatınca ilk olarak sizden bir chain ismi isteyecek. İstediğiniz bir ismi girebilirsiniz.

![Ekran görüntüsü 2024-01-25 232028](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/855de031-ad14-46b7-88bc-011333f8765f)

* İkinci adımdaki seçimi ENTER yapıp geçiyoruz.

![Ekran görüntüsü 2024-01-25 232058](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/5de29fce-115c-42cf-a055-fcb30d827486)

* Üçüncü adımda Çalıştıracağımız DA seçiyoruz. Burada AVAIL seçimi yapacağız.

![Ekran görüntüsü 2024-01-25 232115](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/ae813da1-c25c-4181-bda3-515043599c32)

# Not: BURADA size yeni bir AVAIL adresi verecek onu AVAIL'de puan kastığımız cüzdan ile değiştireceğiz.

İlk olarak aşağıdaki komutu giriyoruz. "" dahil aradaki notu app verdiğin isimle değiştiriyorsun.
```
nano /root/.madara/app-chains/"Verdiğin App name ismi"/da-config.json
```
![Ekran görüntüsü 2024-01-25 232340](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/88e2fd32-1109-4d78-8f1a-dce8902d44be)

* Benzer bir sayda açılacak "seed":"0x... yazan yerdeki private key silip Cüzdan kelimelerimizi ekliyoruz. Son bölümdeki cüzdan adresini de AVAIL'deki cüzdan adresiyle değiştiriyoruz.

* CTRL X Y ve ENTER basıyoruz.
