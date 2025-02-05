# syntax=docker/dockerfile:1

FROM debian:latest
WORKDIR /app
COPY . .
RUN <<EOF
apt-get update
apt-get install -y wget
apt-get install -y tar
apt-get install -y sudo
apt-get install -y whois
useradd -ms /bin/bash vscode
usermod -aG sudo vscode
echo 'vscode ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
EOF
EXPOSE 3000
USER vscode
WORKDIR /home/vscode
RUN <<EOF
sudo wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
sudo tar -C . -xzf go1.23.6.linux-amd64.tar.gz
sudo rm -fr go1.23.6.linux-amd64.tar.gz
echo "export PATH=$PATH:/home/vscode/go/bin" | sudo tee /etc/profile > /dev/null
EOF