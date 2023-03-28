locals {
  ansible_user_data = <<-EOF
#!/bin/bash
sudo apt-get install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
echo "pubkeyAcceptKeyTypes=+ssh-rsa" >> /etc/ssh/sshd_config.d/10-insecure-rsa-keysig.conf
sudo systemctl reload sshd
sudo bash -c ' echo "strictHostKeyChecking No" >> /etc/ssh/ssh_config'
echo "${var.prv_key}" >> /home/ubuntu/.ssh/accepet-key

sudo chmod 400 OAPACPUJP_prv
sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/OAPACPUJP-key 
sudo chgrp ubuntu:ubuntu /home/ubuntu/.ssh/OAPACPUJP-key  
sudo chmod /home/ubuntu/.ssh/OAPACPUJP-key 
sudo echo "localhost ansible_connection=local" > /etc/ansible/hosts
sudo echo "[docker-stage]" >> /etc/ansible/hosts
sudo echo "${var.docker_stage_IP} ansible_ssh_private_key_file=/home/ubuntu/.ssh/OAPACPUJP-key" >> /etc/ansible/hosts
sudo echo "[docker-prod]" >> /etc/ansible/hosts
sudo chown -R ubuntu:ubuntu /etc/ansible
sudo touch docker_image.yml docker_prod.yml docker_stage.yml dockerfile
echo "${file(var.docker-image)}" >> /etc/ansible/hosts/docker-image.yml
echo "${file(var.docker-stage)}" >> /etc/ansible/hosts/docker-stage.yml
echo "${file(var.docker-prod)}" >> /etc/ansible/hosts/docker-prod.yml
echo "${file(var.dockerfile)}" >> /etc/ansible/hosts/dockerfile
sudo hostnamectl set-hostname Ansible
EOF
}

/*echo "${local.ec2_creds.pass}" >> /home/ubuntu/only.text*/





 /*sudo yum update -y
 sudo dnf install python3 -y
 sudo yum install python3-pip -y
 sudo pip3 install boto boto3 botocore
 sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
 sudo yum install ansible -y
 sudo chown ec2-user:ec2-user /etc/ansible/hosts
 sudo chown -R ec2-user:ec2-user /etc/ansible && chmod +x /etc/ansible
 sudo hostnamectl set-hostname ansible
 sudo chmod 777 /etc/ansible/hosts
 sudo su echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
 sudo bash -c 'echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
 sudo echo "[QA_Server]" >> /etc/ansible/hosts
 sudo echo "${var.QA_Server_prub_ip} ansible_user=ec2-user  ansible_ssh_private_key_file=/home/ec2-user/padeu2-kp" >> /etc/ansible/hosts
 sudo echo "[docker_host]" >> /etc/ansible/hosts
 sudo echo "${var.docker_priv_ip} ansible_user=ec2-user  ansible_ssh_private_key_file=/home/ec2-user/padeu2-kp" >> /etc/ansible/hosts
 echo "license_key: eu01xx26f63c4044f9057a5877073cc5a801NRAL" | sudo tee -a /etc/newrelic-infra.yml
 sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/9/x86_64/newrelic-infra.repo
 sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
 sudo yum install newrelic-infra -y*/