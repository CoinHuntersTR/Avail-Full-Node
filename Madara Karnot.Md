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
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
```
sudo apt update
```
```
sudo apt install docker-ce
```
```
sudo systemctl start docker
```
```
sudo systemctl enable docker
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

# Not-2: Eğer ilk defa katılacaksanız. Aşağıdaki komutu çalıştırıp içindeki bilgileri bir yere not edin. Devam etmeden önce AVAIL discordundan [BURADAN](https://discord.gg/availproject) giriyoruz. Gitcoin pass puanımızın 20 ve üzerinde olması gerekiyor. Discord ve Gitcoin Pass doğrulamasını yaptıktan sonra Goldberg Faucet kanalından node içinde oluşan cüzdana token istiyoruz. Tokenler geldikten sonra aşağıdaki işlemlere devam ediyoruz.


İlk olarak aşağıdaki komutu giriyoruz. "" dahil aradaki notu silip  app'e verdiğin isimle değiştiriyorsun.
```
nano /root/.madara/app-chains/"Verdiğin App name ismi"/da-config.json
```
![Ekran görüntüsü 2024-01-25 232340](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/88e2fd32-1109-4d78-8f1a-dce8902d44be)

* Benzer bir sayda açılacak "seed":"0x... yazan yerdeki private key silip Cüzdan kelimelerimizi ekliyoruz. Son bölümdeki cüzdan adresini de AVAIL'deki cüzdan adresiyle değiştiriyoruz.

* CTRL X Y ve ENTER basıyoruz.

### Gerekli Portları açıyoruz.
```
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 4000
sudo ufw allow 5353
sudo ufw allow 47250
sudo ufw allow 39276
sudo ufw allow 36347
sudo ufw allow 43759
sudo ufw allow 40815
sudo ufw allow 30333
sudo ufw allow 9944
sudo ufw allow 9944
```
### Yeni bir screen açalım
```
sudo apt install screen
```
```
screen -S roller
```
### App-chaini çalıştırıyoruz.

```
./target/release/madara run
```
Çalıştıktan sonra bloklar akmaya başladığında CTRL A+D ile çıkıyoruz.

### Exlporer sayfamızı çalıştıralım
```
cd
cd madara-cli
./target/release/madara explorer --host=IPAdresin.
```
Bu çalıştıktan sonra. http://SUNUCUIPADRESI:4000 sayfasından app-chaininize ait explorer ulaşabilirsiniz.

![Ekran görüntüsü 2024-01-26 003113](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/b568b4b2-d4ab-4e9d-a2df-92c06fe9afb3)

### En son App yayınlayalım

Önce aşağıdaki örnek olan komutları uyarılara göre düzenliyoruz.
```
{
  "name": "App İsminiz",
  "logo": "https://placehold.co/400x400", // 400x400 boyutunda logo herhangi bir yere yükleyip linkini alabilirsiniz.
  "rpc_url": "http://SUNUCU IP ADRESIN:9944",
  "explorer_url": "http://SUNUCU IP ADRESIN:4000",
  "metrics_endpoint": "http://SUNUCU IP ADRESIN:9615",
  "id": "" 
```
* ID almak için [BURADAN](https://www.uuidgenerator.net/) siteye gidiyoruz. Refresh yapıyoruz. çıkan ID alıp kopyalıyoruz.

![Ekran görüntüsü 2024-01-27 215100](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/3f519de4-93c8-4167-8545-786729ba784c)

400x400 boyutunnda bir resim ayarlıyoruz. [BURADAN](https://resimlink.com/)

![Ekran görüntüsü 2024-01-27 215606](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/b336b64a-e32c-44b3-b8b3-e7b5d320fe18)

* Resim Direkt linki alıp Yukarıdaki json dosyanıza ekleyebilirsiniz.

* Yukarıdaki komutları düzenleyiyoruz. Bir tane json dosyası oluşturuyoruz. Dosya isminiz aldığınız ID ismi olacaktır.

![Ekran görüntüsü 2024-01-27 220406](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/67f0ebd0-44eb-4309-bae2-39fd9286dc37)


## PR Açıyoruz.

[BURADAN](https://github.com/karnotxyz/avail-campaign-listing) buraya gidiyoruz ve ilk olarak Forkluyoruz.

![Ekran görüntüsü 2024-01-27 215811](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/e75cae6d-b503-49ed-b73b-222a1ee56d1c)

Forkladıktan sonra app-chains klasörüne giriyoruz.

![Ekran görüntüsü 2024-01-27 215936](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/0437e175-a142-44c7-a465-d48ef194dd89)

* Buradan hazırladığımız json dosyasını buraya yüklüyoruz. 

![Ekran görüntüsü 2024-01-27 220708](https://github.com/CoinHuntersTR/Avail-Full-Node/assets/111747226/38efaa74-0a00-499a-93f7-5f66d3ff3853)

Yükledikten sonra sağ üstten Pull Request yapıyoruz. Başlık bölümüne ✨ Adding verdiğiniz app ismi şeklinde yazabilirsiniz.
