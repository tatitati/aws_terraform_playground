provider "aws" {
  region     = "eu-central-1"
}


module "sqs" {
  source = "./modules/sqs"
}
