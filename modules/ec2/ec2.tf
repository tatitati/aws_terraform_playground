resource "aws_instance" "my-test-instance" {
  ami             = "ami-fa7cdd89"
  instance_type   = "t2.micro"
  tags = {
    Name = "test-instance"
  }
}