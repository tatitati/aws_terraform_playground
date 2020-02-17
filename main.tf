provider "aws" {
  region     = "eu-central-1"
}


# module "sqs" {
#   source = "./modules/sqs"
# }

# resource "aws_instance" "my-test-instance" {
#   ami             = "ami-fa7cdd89"
#   instance_type   = "t2.micro"
#   tags = {
#     Name = "test-instance"
#   }
# }

resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  parameters = {
    VPCCidr = "10.0.0.0/16"
  }

  template_body = <<STACK
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "10.0.0.0/16",
      "Description" : "Enter the CIDR block for the VPC. Default is 10.0.0.0/16."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
STACK
}