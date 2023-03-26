locals {
  ansible_user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo yum install python3.8 -y
sudo alternatives --set python /usr/bin/python3.8
sudo yum -y install python3-pip
sudo yum install ansible -y
pip3 install ansible --user
sudo chown ec2-user:ec2-user /etc/ansible
ansible-galaxy collection install amazon.aws
pip3 install boto3
#NEW RELIC SETUP
echo "license_key: eu01xx26f63c4044f9057a5877073cc5a801NRAL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
echo "PubkeyAcceptedKeyTypes=+ssh-rsa" >> /etc/ssh/ssh_config.d/10-insecure-rsa-keysig.conf
sudo service sshd reload
sudo bash -c ' echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
echo "${var.prv_key}" >> /home/ec2-user/.ssh/anskey_rsa
sudo chmod 400 anskey_rsa
sudo chmod -R 700 .ssh/
sudo chown -R ec2-user:ec2-user .ssh/
sudo yum install -y yum-utils
#DOCKER HUB CONFIGURATION
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user
#CHANGE OWNERSHIP OF DIRECTORY TO EC2-USER
cd /etc
sudo chown ec2-user:ec2-user hosts
cat <<EOT>> /etc/ansible/hosts
localhost ansible_connection=local
[docker_stage]
${var.docker_stage_IP}  ansible_ssh_private_key_file=/home/ec2-user/.ssh/anskey_rsa
[docker_prod]
${var.docker_prod_IP}  ansible_ssh_private_key_file=/home/ec2-user/.ssh/anskey_rsa
sudo touch docker_image.yml docker_prod.yml docker_stage.yml newrelic.yml
echo "${file(var.docker-image)}" >> /etc/ansible/hosts/docker-image.yml
echo "${file(var.docker-stage)}" >> /etc/ansible/hosts/docker-stage.yml
echo "${file(var.docker-prod)}" >> /etc/ansible/hosts/docker-prod.yml
echo "${file(var.dockerfile)}" >> /etc/ansible/hosts/dockerfile
echo "${file(var.newrelic)}" >> /etc/ansible/hosts/newrelic.yml
sudo hostnamectl set-hostname Ansible
EOF
}
