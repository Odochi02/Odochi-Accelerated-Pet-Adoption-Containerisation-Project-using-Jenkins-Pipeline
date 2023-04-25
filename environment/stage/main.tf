module "vpc" {
  source   = "../../modules/VPC"
  vpc_cidr = var.vpc_cidr

}

module "subnets" {
  source   = "../../modules/subnets"
  OAPACPUJPpubsub1_cidr = var.OAPACPUJPpubsub1_cidr
  OAPACPUJPpubsub2_cidr = var.OAPACPUJPpubsub2_cidr
  OAPACPUJPprvsub1_cidr = var.OAPACPUJPprvsub1_cidr
  OAPACPUJPprvsub2_cidr = var.OAPACPUJPprvsub2_cidr
  all_ip             = var.all_ip
  vpc_id   = module.vpc.vpc_id
  
}

module "security_groups" {
  source   = "../../modules/security_groups"
  ssh_port = var.ssh_port
  sonarqube_port = var.sonarqube_port
  jenkins_port = var.jenkins_port
  all_ip             = var.all_ip
  vpc_id   = module.vpc.vpc_id
 
}

module "keypair" {
  source = "../../modules/keypair"
}

module "ansible" {
  source           = "../../modules/ansible"
  keypair          = module.keypair.OAPACPUJP_pub_key
  ami_ubuntu              = var.ami_ubuntu
  instance_type    = var.instance_type
  ansible_sg       = module.security_groups.ansible_sg
  ansible_lb_sg = module.security_groups.ansible_lb_sg
  vpc_id   = module.vpc.vpc_id
  OAPACPUJPprvsub1_id = module.subnets.prvsub_1
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
  OAPACPUJPpubsub2_id = module.subnets.pubsub_2
  prv_key          = module.keypair.prv_key
  newrelic = "../../modules/ansible/newrelic.yml"
  dockerfile = "../../modules/ansible/dockerfile"
  docker-image = "../../modules/ansible/docker-image.yml"
  docker-prod = "../../modules/ansible/docker-prod.yml"
  docker-stage = "../../modules/ansible/docker-stage.yml"
  docker_prod_IP = module.docker-prod.docker_prod_IP
  docker_stage_IP = module.docker-stage.docker_stage_IP
}

module "jenkins" {
  source           = "../../modules/jenkins"
  keypair          = module.keypair.OAPACPUJP_pub_key
  prv_key          = module.keypair.prv_key
  ami_redhat              = var.ami_redhat
  instance_type    = var.instance_type
  jenkins_sg       = module.security_groups.jenkins_sg
  jenkins_lb_sg = module.security_groups.jenkins_lb_sg
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
  OAPACPUJPpubsub2_id = module.subnets.pubsub_2
  OAPACPUJPprvsub1_id = module.subnets.prvsub_1
  vpc_id   = module.vpc.vpc_id
}

module "docker-prod" {
  source           = "../../modules/docker-prod"
  keypair          = module.keypair.OAPACPUJP_pub_key
  prv_key          = module.keypair.prv_key
  ami_redhat              = var.ami_redhat
  instance_type    = var.instance_type
  docker-prod_sg       = module.security_groups.docker-prod_sg
  docker_prod_lb_sg       = module.security_groups.docker_prod_lb_sg
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
  OAPACPUJPpubsub2_id = module.subnets.pubsub_2
  OAPACPUJPprvsub1_id = module.subnets.prvsub_1
  OAPACPUJPprvsub2_id = module.subnets.prvsub_2
  vpc_id   = module.vpc.vpc_id
}

module "docker-stage" {
  source           = "../../modules/docker-stage"
  keypair          = module.keypair.OAPACPUJP_pub_key
  prv_key          = module.keypair.prv_key
  ami_redhat              = var.ami_redhat
  instance_type    = var.instance_type
  docker-stage_sg       = module.security_groups.docker-stage_sg
  docker_stage_lb_sg       = module.security_groups.docker_stage_lb_sg
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
  OAPACPUJPpubsub2_id = module.subnets.pubsub_2
  OAPACPUJPprvsub1_id = module.subnets.prvsub_1
  vpc_id   = module.vpc.vpc_id
}

module "sonarqube" {
  source           = "../../modules/sonarqube"
  keypair          = module.keypair.OAPACPUJP_pub_key
  prv_key          = module.keypair.prv_key
  ami_ubuntu             = var.ami_ubuntu
  instance_type    = var.instance_type
  sonarqube_sg       = module.security_groups.sonarqube_sg
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
  vpc_id   = module.vpc.vpc_id
}

module "bastion" {
  source           = "../../modules/bastion"
  keypair          = module.keypair.OAPACPUJP_pub_key
  prv_key          = module.keypair.prv_key
  ami_redhat              = var.ami_redhat
  instance_type    = var.instance_type
  bastion_sg       = module.security_groups.bastion_sg
  OAPACPUJPpubsub1_id = module.subnets.pubsub_1
}

/*module "route53" {
  source = "../../Modules/route53"
  docker-prod-lb-dns = module.docker-prod.docker-prod-lb.dns_name
  docker-prod-lb-zone-id = module.docker-prod.docker-prod-lb-zone-id
  
}
module "ASG" {
  source = "../../modules/ASG"
  keypair          = module.keypair.OAPACPUJP_pub_key
   ami_redhat               = var.ami_redhat
  instance_type = var.instance_type
  docker-prod_sg       = module.security_groups.docker-prod_sg
  OAPACPUJPpubsub1_id = [module.subnet.pubsub_1, module.subnet.pubsub_2]
  OAPACPUJP-tgarn = module.lb.target_group_arn
}*/




