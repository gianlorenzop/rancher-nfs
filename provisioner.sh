#!/bin/bash
echo I am provisioning...
date > /etc/vagrant_provisioned_at
sudo yum install -y wget curl openssl bridge-utils
sudo mv /vagrant/rke_linux-amd64 /usr/bin/rke
sudo chmod +x /usr/bin/rke
sudo sysctl net.bridge.bridge-nf-call-iptables=1 && echo 'net.bridge.bridge-nf-call-iptables = 1' >> /etc/sysctl.conf && sysctl daemon-reload
curl https://releases.rancher.com/install-docker/18.09.2.sh | sh
usermod -aG docker vagrant 
sudo echo 'AllowTcpForwarding yes' >> /etc/ssh/sshd_config && sudo systemctl restart sshd.service
mv /vagrant/cluster.yml ~/
if [ "$(hostname)" == "rancher2" ];then /usr/bin/rke up;fi

