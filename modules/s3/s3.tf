resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  policy = var.bucket_policy

  logging {
    target_bucket = var.loggin_bucket
    target_prefix = "accessslog-"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
