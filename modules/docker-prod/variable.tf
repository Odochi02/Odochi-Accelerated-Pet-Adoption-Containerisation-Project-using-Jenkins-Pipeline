#vpc id
variable "vpc_id" {

}

#keypair variable
variable "keypair" {
}

#security group
variable "docker-prod_sg" {
}

#ami
variable "ami_redhat" {
}

#instance type
variable "instance_type" {
}


#public subnet 1 id
variable "OAPACPUJPpubsub1_id" {
}

#public subnet 2 id
variable "OAPACPUJPpubsub2_id" {
}

#private subnet 1 id
variable "OAPACPUJPprvsub1_id" {
}


#private subnet 2 id
variable "OAPACPUJPprvsub2_id" {
}

#prv_key
variable "prv_key" {
}

#security group
variable "docker_prod_lb_sg" {
}

variable "docker-prod-lb-name" {
    default = "docker-prod-lb"
}

