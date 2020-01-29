variable "env" {}

resource "aws_instance" "example" {
  ami           = "ami-07cda0db070313c52"
  instance_type = "t2.micro"
  tags = {
    Name         = "instance-${var.env}"
  }
}

