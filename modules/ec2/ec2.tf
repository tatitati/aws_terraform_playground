# EC2 user data
# -------------
data "template_file" "init" {
  template = "${file("${path.module}/my_user_data.sh")}"
}

# SG to ssh into the instance
# --------------------------
resource "aws_security_group" "ssh_access_terraform" {
  name = "ec2_ssh_access__terraform"

  # SSH access from anywhere
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "my-test-instance" {
  ami             = "ami-07cda0db070313c52"
  instance_type   = "t2.micro"
  key_name        = "new_ec2_keypar"
  user_data       = data.template_file.init.rendered
  security_groups = ["${aws_security_group.ssh_access_terraform.name}"]

  tags = {
    Name = "test-instance"
  }
}
