#security groups using Terraform

resource "aws_security_group" "sec_ssh" {
  name        = "security group 1 using Terraform"
  description = "security group 1 using Terraform"
  vpc_id      = "vpc-01ed8e887aced9a3a"

  ingress{
    description = "TLC from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec_ssh"
    Terraform =  true
  }
}

resource "aws_security_group" "sec_http" {
  name        = "security group 2 using Terraform"
  description = "security group 2 using Terraform"
  vpc_id      = "vpc-01ed8e887aced9a3a"

  ingress{
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec_http"
    Terraform =  true
  }
}