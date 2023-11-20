<h1 align="center"> Avail Node Rehberi
  

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
