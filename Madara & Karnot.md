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

```
source $HOME/.cargo/env
```
* Rust versionu kontrol edelim;

```
rustc --version
```
* versionumuz: rustc 1.75.0 (82e1608df 2023-12-21)

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
* Not gelecek diye yazayım...
```
./target/release/madara init
```

