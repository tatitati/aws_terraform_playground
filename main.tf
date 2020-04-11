provider "aws" {
  region     = "eu-central-1"
}


# module "sqs" {
#   source = "./modules/sqs"
# }

# module "ec2" {
#   source = "./modules/ec2"
# }

# module "ecs" {
#   source = "./modules/ecs_task_definition_1container"
# }

module "snowflake" {
  source = "./modules/snowflake"
}

# Import this with
# arn=arn:aws:kms:eu-central-1:3384.....:key/1c88223b......
# terraform import aws_kms_key.example $arn
# resource "aws_kms_key" "example" {
#   description = "example"
#   deletion_window_in_days = 10
#
#   policy = "${file("modules/kms/kms-policy.json")}"
# }
