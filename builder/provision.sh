#!/bin/bash -x

# Add Docker repository
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

# Install and configure Docker Engine
yum -y install docker-engine-1.11.0
cp -f /vagrant/docker.service /etc/systemd/system/docker.service
systemctl daemon-reload
systemctl start docker
systemctl enable docker

# Install useful dockviz utility
wget "https://github.com/justone/dockviz/releases/download/v0.3/dockviz_linux_amd64" -O/usr/bin/dockviz
chmod +x /usr/bin/dockviz

# Enable non-root Docker operation
gpasswd -a vagrant docker

# Install development tools
yum -y groupinstall "Development Tools"
yum -y install python-devel
curl https://bootstrap.pypa.io/get-pip.py | python

# Install lain-sdk and lain-cli
pip install git+https://github.com/ericpai/wssh.git  # FIXME
pip install git+https://github.com/laincloud/lain-sdk.git
pip install git+https://github.com/laincloud/lain-cli.git
