# Create Ansible Security Group
resource "aws_security_group" "OAPACPUJP_ansible_sg" {
  name        = "OAPACPUJP_ansible_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id


  ingress {
    description = "Allow ssh traffic"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.all_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_ip]
  }

  tags = {
    Name = "OAPACPUJP_ansible_sg"
  }
}

# Create Sonarqube Security Group
resource "aws_security_group" "OAPACPUJP_sonarqube_sg" {
  name        = "OAPACPUJP_sonarqube_sg"
  description = "Allow Jenkins traffic"
  vpc_id      = var.vpc_id


  ingress {
    description      = "sonarqube"
    from_port        = var.sonarqube_port
    to_port          = var.sonarqube_port
    protocol         = "tcp"
    cidr_blocks = ["129.205.113.155/32"] # my computer ip address
  }

  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks = ["129.205.113.155/32"] # my computer ip address
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.OAPACPUJP_jenkins_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "OAPACPUJP_sonarqube_sg"
  }
}

# Create Docker-PROD Security Group
resource "aws_security_group" "OAPACPUJP_docker-prod_sg" {
  name        = "OAPACPUJP_docker-prod_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  
ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
}
   
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
    }

  ingress {
    description      = "HTTPS"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "OAPACPUJP_docker-prod_sg"
  }
}

# Create Docker-Stage Security Group
resource "aws_security_group" "OAPACPUJP_docker-stage_sg" {
  name        = "OAPACPUJP_docker-stage_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  
ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
}
   
  ingress {
    description      = "SSH"
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
  }

ingress {
    description      = "APPLICATION"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
}

ingress {
    description      = "APPLICATION"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
}

ingress {
    description      = "APPLICATION"
    from_port        = 8085
    to_port          = 8085
    protocol         = "tcp"
    cidr_blocks = [var.all_ip]
}
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "OAPACPUJP_docker-stage_sg"
  }
}

# Create Security Group for Bastion Host 
resource "aws_security_group" "OAPACPUJP_bastion_sg" {
  name        = "OAPACPUJP_bastion_sg"
  description = "Allow traffic for ssh"
  vpc_id      = var.vpc_id

  
  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["129.205.113.155/32"] # my computer ip address
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "OAPACPUJP_bastion_sg"
  }
}

# Create Jenkins Security Group
resource "aws_security_group" "OAPACPUJP_jenkins_sg" {
  name        = "OAPACPUJP_jenkins_sg"
  description = "Allow Jenkins traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Port traffic"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.all_ip]
  }

  ingress {
    description = "Allow http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.all_ip]
  }
  ingress {
    description = "Allow ssh traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.all_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_ip]
  }

  
  tags = {
    Name = "OAPACPUJP_jenkins_sg"
  }
  }

