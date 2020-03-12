# user data
# -------------
data "template_file" "init" {
  template = "${file("${path.module}/my_user_data.sh")}"
}

# SG to ssh
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

  # Allow the ec2 to communicate with the exterior
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# MAIN
# --------------------------
resource "aws_instance" "my-test-instance" {
  ami             = "ami-0ec1ba09723e5bfac"
  instance_type   = "t2.micro"
  key_name        = "new_ec2_keypar"
  user_data       = data.template_file.init.rendered
  security_groups = ["${aws_security_group.ssh_access_terraform.name}"]

  tags = {
    Name = "test-instance"
  }
}
