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

module "snowflake_mynewsuperbucket" {
  source = "./modules/snowflake"
  namerole    = "snowflake_mynewsuperbucket_role"
  namepolicy  = "snowflake_mynewsuperbucket_policy"
  arn_bucket  = "arn:aws:s3:::mynewsuperbucket"
  trust_relationship__trusted_entities = "arn:aws:iam::574791053325:user/czzi-s-iess5178"
  trust_relationship__conditions__externalid = "XXXXXXXXX"
}

module "snowflake_thisismybucketagain" {
  source      = "./modules/snowflake"
  namerole    = "snowflake_thisismybucketagain_role"
  namepolicy  = "snowflake_thisismybucketagain_policy"
  arn_bucket  = "arn:aws:s3:::thisismybucketagain"
  trust_relationship__trusted_entities = "arn:aws:iam::574791053325:user/czzi-s-iess5178"
  trust_relationship__conditions__externalid = "YYYYYYYYY"
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
