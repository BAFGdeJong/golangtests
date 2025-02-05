# syntax=docker/dockerfile:1

FROM debian:latest
WORKDIR /app
COPY . .
RUN <<EOF
apt-get update
apt-get install -y wget
apt-get install -y tar
cd /bin
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz
tar -C . -xzf go1.23.6.linux-amd64.tar.gz
echo "export PATH=$PATH:/bin/go/bin" >> /etc/profile
rm -fr go1.23.6.linux-amd64.tar.gz
useradd -ms /bin/bash vscode
EOF
USER vscode
WORKDIR /home/newuser
EXPOSE 3000