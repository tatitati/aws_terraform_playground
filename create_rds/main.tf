provider "aws" {
  region     = "eu-central-1"
}

resource "aws_db_instance" "mydb1" {
  allocated_storage        = 256 # gigabytes
  backup_retention_period  = 7   # in days  
  engine                   = "postgres"
  engine_version           = "9.5.4"
  identifier               = "mydb1"
  instance_class           = "db.r3.large"
  multi_az                 = false
  name                     = "mydb1"
  port                     = 5432
  publicly_accessible      = false
  storage_encrypted        = false
  storage_type             = "gp2"
  username                 = "mydb1"
  password                 = "mypassword"
  # parameter_group_name     = "mydbparamgroup1" # if you have tuned it
  # vpc_security_group_ids   = ["${aws_security_group.default.id}"]
  vpc_security_group_ids   = ["sg-0500b5c8205ab343b"] # is a SG
  skip_final_snapshot      = true # This allow to destroy with no problems the db instance
  # db_subnet_group_name     = "${aws_db_subnet_group.default.id}"
}

# resource "aws_db_subnet_group" "default" {
#   name        = "main_subnet_group"
#   description = "Our main group of subnets"
#   subnet_ids  = ["subnet-0994fe366bb272e2a", "subnet-0af7d33417c66b37d"] # default_subnet_1, default_subnet_2
#   # subnet_ids  = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
# }