resource "aws_instance" "web" {
  ami           = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"

  tags = {
    Name = "exercise_0100"
    Terraform = true
  }
}
