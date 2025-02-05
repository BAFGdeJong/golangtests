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
cd /bin
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
tar -C . -xzf go1.23.6.linux-amd64.tar.gz
echo "export PATH=$PATH:/bin/go/bin" >> /etc/profile
rm -fr go1.23.6.linux-amd64.tar.gz
echo "vscode:pass" | chpasswd
useradd -ms /bin/bash -G sudo vscode
EOF
WORKDIR /home/vscode
EXPOSE 3000
USER vscode