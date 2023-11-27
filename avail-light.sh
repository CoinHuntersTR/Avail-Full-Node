#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 && curl -s https://raw.githubusercontent.com/CoinHuntersTR/Andromeda-Testnet-Rehberi/main/logo.sh | bash && sleep 1

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update && sudo apt upgrade -y

echo -e "\e[1m\e[32m2. Installing dependencies... \e[0m" && sleep 1
# packages
sudo apt install curl tar wget clang pkg-config protobuf-compiler libssl-dev jq build-essential protobuf-compiler bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
sleep 1

echo -e "\e[1m\e[32m3. Downloading and building binaries... \e[0m" && sleep 1
# download binary
git clone https://github.com/availproject/avail-light.git
cd avail-light
wget -O config.yaml https://raw.githubusercontent.com/thenhthang/vinnodes/main/Avail/config.yaml
git checkout v1.7.3
cargo build --release
sudo cp $HOME/avail-light/target/release/avail-light /usr/local/bin
# create service
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

echo -e "\e[1m\e[32m4. Starting service... \e[0m" && sleep 1
# start service
sudo systemctl daemon-reload
sudo systemctl enable availightd
sudo systemctl restart availightd

echo '=============== SETUP FINISHED ==================='
echo -e 'View the logs from the running service:: journalctl -f -u availightd.service'
echo -e "Check the node is running: sudo systemctl status availightd.service"
echo -e "Stop your avail node: sudo systemctl stop availightd.service"
echo -e "Start your avail node: sudo systemctl start availightd.service"
