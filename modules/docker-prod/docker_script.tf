locals {
  docker_user_data = <<-EOF
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo yum install -y yum-utils
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
#Start docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
sudo hostnamectl set-hostname docker-prod-server

sudo bash -c "echo 'strictHostKeyChecking No' >> /etc/ssh/ssh_config"
#Install New relic
echo "license_key: eu01xx26f63c4044f9057a5877073cc5a801NRALL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/9/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y

echo "****************Change Hostname(IP) to something readable**************"
sudo hostnamectl set-hostname Docker-Prod
sudo reboot
EOF
 
}


/*echo "${local.ec2_creds.surething}" >> /home/ec2-user/only.txt*/