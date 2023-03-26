# Public Subnet 1 CIDR
variable "OAPACPUJPpubsub1_cidr" {
  default = "10.0.1.0/24"
}

# Public Subnet 2 CIDR
variable "OAPACPUJPpubsub2_cidr" {
  default = "10.0.2.0/24"
}

# Private Subnet 1 CIDR
variable "OAPACPUJPprvsub1_cidr" {
  default = "10.0.3.0/24"
}

# Private Subnet 2 CIDR
variable "OAPACPUJPprvsub2_cidr" {
  default = "10.0.4.0/24"
}

#All IP CIDR
variable "all_ip" {
  default = "0.0.0.0/0"
}

#ssh port
variable "ssh_port" {
  default = 22
}

#Sonarqube port
variable "sonarqube_port" {
    default = 9000

}


# Jenkins port
variable "jenkins_port" {
    default = 8080

}

# keypair variable
variable "keypair" {
  default = ""
}

#security group
variable "ansible_sg" {
  default = ""
}

variable "sonarqube_sg" {
  default = ""
}

variable "docker-stage_sg" {
  default = ""
}

variable "docker-prod_sg" {
  default = ""
}

variable "bastion_sg" {
  default = ""
}

variable "jenkins_sg" {
  default = ""
}

#ami
variable "ami_ubuntu" {
  default = "ami-0735c191cf914754d"
}

#ami
variable "ami_redhat" {
  default = "ami-0edab8d70528476d3"
}

#instance type
variable "instance_type" {
  default = "t2.medium"

}

#public subnet id
variable "OAPACPUJPpubsub1_id" {
  default = ""
}

#public subnet id
variable "OAPACPUJPprvsub1_id" {
  default = ""
}

