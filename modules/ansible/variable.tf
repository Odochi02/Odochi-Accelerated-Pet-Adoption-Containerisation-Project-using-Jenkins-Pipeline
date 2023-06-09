#vpc id
variable "vpc_id" {

}

#keypair variable
variable "keypair" {
}

#security group
variable "ansible_sg" {
}


#ami
variable "ami_ubuntu" {
}

#instance type
variable "instance_type" {
}


#private subnet id
variable "OAPACPUJPprvsub1_id" {
}

#prv_key
variable "prv_key" {
}

#docker_stage_IP
variable "docker_stage_IP" {
}

#docker_prod_IP
variable "docker_prod_IP" {
}


#docker_image.yml
variable "docker-image" {
}

#docker_prod.yml
variable "docker-prod" {
}

#docker_stage.yml
variable "docker-stage" {
}

#newrelic.yml
variable "newrelic" {
}

#dockerfile.yml
variable "dockerfile" {
}

#lb security group
variable "ansible_lb_sg" {
}

variable "ansible-lb-name" {
    default = "ansible-lb"
}

#public subnet 1 id
variable "OAPACPUJPpubsub1_id" {
}

#public subnet 2 id
variable "OAPACPUJPpubsub2_id" {
}