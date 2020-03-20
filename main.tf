provider "aws" {
  region     = "eu-central-1"
}


# module "sqs" {
#   source = "./modules/sqs"
# }

# module "ec2" {
#   source = "./modules/ec2"
# }

module "ecs" {
  source = "./modules/ecs"
}
