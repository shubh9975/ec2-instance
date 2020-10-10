resource "aws_instance" "web" {
  ami           = "ami-0e306788ff2473ccb"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

