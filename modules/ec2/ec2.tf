# user data
# ---------
data "template_file" "init" {
  template = "${file("${path.module}/my_user_data.sh")}"
}

# SG to ssh and can connect with exterior
# --------------------------------------
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

# Attaches a Managed IAM Policy to an IAM role to read S3
#--------------------------------------------------------
#       trusted policy (who can assume this role)
resource "aws_iam_role" "role" {
  name                = "terraform-role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Sid": ""
    }
  ]
}
EOF
}

#       policies attached to role
resource "aws_iam_role_policy" "policy" {
  name          = "test-policy"
  role = aws_iam_role.role.id
  policy=<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*",
        "ecr:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Policies associated to the role (what can be done with this role)
resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.role.name
}

data "aws_ami" "my_data_amis" {
  most_recent = true
  owners      = ["amazon"]
  filter {
      name   = "name"
      values = ["amzn2-ami-hvm*"]
    }
}

# MAIN
# ----
resource "aws_instance" "my-test-instance" {
  # ami                   = "ami-0ec1ba09723e5bfac"
  ami                   = data.aws_ami.my_data_amis.id
  instance_type         = "t2.micro"
  key_name              = "new_ec2_keypar"
  user_data             = data.template_file.init.rendered
  security_groups       = [aws_security_group.ssh_access_terraform.name]
  iam_instance_profile  = aws_iam_instance_profile.test_profile.name

  tags = {
    Name = "test-instance"
  }
}
