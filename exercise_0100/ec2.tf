resource "aws_instance" "web" {
  ami           = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sec_ssh.name, aws_security_group.sec_http.name]

  tags = {
    Name = "exercise_0100"
    Terraform = true
  }
}
