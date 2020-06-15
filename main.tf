provider "aws" {
  profile     = "user-admin"
  region      = "eu-central-1"
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

# module "kms_key" {
#   source = "./modules/kms"
#
#   kms_alias = "mykms_alias"
# }

# module "s3_thisismybucketagain" {
#   source = "./modules/s3"
#
#   kms_key_arn   = module.kms_key.kms_key_arn
#   bucket_name   ="mynewsuperbucket"
#   loggin_bucket = "mynewsuperbucketlog"
#   bucket_policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": [
#                     "arn:aws:iam::338456148177:role/snowflake_mynewsuperbucket_role"
#                 ]
#             },
#             "Action": "s3:ListBucket",
#             "Resource": "arn:aws:s3:::mynewsuperbucket"
#         },
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": [
#                     "arn:aws:iam::338456148177:role/snowflake_mynewsuperbucket_role"
#                 ]
#             },
#             "Action": "s3:PutObject",
#             "Resource": "arn:aws:s3:::mynewsuperbucket/*"
#         }
#     ]
# }
# EOF
# }

# module "snowflake_mynewsuperbucket_role" {
#   source = "./modules/snowflake"
#
#   namerole    = "snowflake_mynewsuperbucket_role"
#   namepolicy  = "snowflake_mynewsuperbucket_policy"
#   arn_bucket  = "arn:aws:s3:::mynewsuperbucket"
#   trust_relationship__trusted_entities        = "arn:aws:iam::574791053325:user/czzi-s-iess5178"
#   trust_relationship__conditions__externalid  = "RP52309_SFCRole=4_PVCpzOba/eoBP9U4VGP+Xd1jH1g="
# }

# module "snowflake_thisismybucketagain_role" {
#   source      = "./modules/snowflake"
#
#   namerole    = "snowflake_thisismybucketagain_role"
#   namepolicy  = "snowflake_thisismybucketagain_policy"
#   arn_bucket  = "arn:aws:s3:::thisismybucketagain"
#   trust_relationship__trusted_entities        = "arn:aws:iam::574791053325:user/czzi-s-iess5178"
#   trust_relationship__conditions__externalid  = "RP52309_SFCRole=4_uj+EC4p82mwmQLU0HH8iwpYtHkI="
# }

# Import this with
# arn=arn:aws:kms:eu-central-1:3384.....:key/1c88223b......
# terraform import aws_kms_key.example $arn
# resource "aws_kms_key" "example" {
#   description = "example"
#   deletion_window_in_days = 10
#
#   policy = "${file("modules/kms/kms-policy.json")}"
# }

# module "iamrole_to_be_assumed_by_user" {
#   source = "./modules/iamrole"
# }

# module "cloudfront_s3" {
#     source = "./modules/cloudfront_s3"
# }

module "cloudfront" {
    source = "./modules/cloudfront"
}
