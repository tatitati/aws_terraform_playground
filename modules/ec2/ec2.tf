resource "aws_instance" "my-test-instance" {
  ami             = "ami-07cda0db070313c52"
  instance_type   = "t2.micro"
  key_name        = "new_ec2_keypar"
  tags = {
    Name = "test-instance"
  }
}
