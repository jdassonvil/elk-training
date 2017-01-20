yum update
curl -fsSL https://get.docker.com/ | sh
yum install -y docker-engine
systemctl enable docker.service
systemctl start docker
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
