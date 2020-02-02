provider "aws" {
  region     = "eu-central-1"
}

# resource "aws_sqs_queue" "terraform_queue_deadletter" {  # Dead letter queue is another normal queue as you can see
#   name = "terraform-example-queue-deadletter"
#   delay_seconds = 90
#   max_message_size = 2048
#   message_retention_seconds = 86400
#   receive_wait_time_seconds = 10
# }

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  # redrive_policy            = jsonencode({
  #   deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn
  #   maxReceiveCount     = 4
  # })
}