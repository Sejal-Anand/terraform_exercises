#security groups using Terraform

resource "aws_security_group" "sec_ssh" {
  name        = "security group 1 using Terraform"
  description = "security group 1 using Terraform"
  vpc_id      = "vpc-01ed8e887aced9a3a"
  
  tags = {
    Name = "sec_ssh"
    Terraform =  true
  }
}

resource "aws_security_group_rule" "sec_ssh_i1" {
    type = "ingress"
    description = "TLC from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sec_ssh.id

}



resource "aws_security_group" "sec_http" {
  name        = "security group 2 using Terraform"
  description = "security group 2 using Terraform"
  vpc_id      = "vpc-01ed8e887aced9a3a"
  tags = {
    Name = "sec_http"
    Terraform =  true
  }
}

resource "aws_security_group_rule" "sec_http_i1"{
    type              = "ingress"
    description       = "inbound for TCP 1"
    from_port         = 8443
    to_port           = 8443
    protocol          = "tcp"
    cidr_blocks       = ["192.168.0.0/16"]
    security_group_id = aws_security_group.sec_http.id

}

resource "aws_security_group_rule" "sec_http_i2"{
    type              = "ingress"
    description       = "inbound for TCP 2"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["192.168.0.0/16"]
    security_group_id = aws_security_group.sec_http.id

}

resource "aws_security_group_rule" "sec_http_e1"{
    type              = "egress"
    description       = "outbound for TCP 1"
    from_port         = 0
    to_port           = 0
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.sec_http.id

}

