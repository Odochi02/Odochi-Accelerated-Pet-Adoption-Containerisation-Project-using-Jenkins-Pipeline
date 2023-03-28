#vpc id
variable "vpc_id" {

}

#keypair variable
variable "keypair" {
}

#security group
variable "docker-stage_sg" {
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

#public subnet 2 id
variable "OAPACPUJPprvsub1_id" {
}

#prv_key
variable "prv_key" {
}

#security group
variable "docker_stage_lb_sg" {
}

variable "docker-stage-lb-name" {
    default = "docker-stage-lb"
}