data "aws_iam_policy_document" "trust_relationship" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = [var.trust_relationship__trusted_entities]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values = [
        var.trust_relationship__conditions__externalid
      ]
    }
  }
}



data "aws_iam_policy_document" "policy_permissions" {
  statement {
    effect = "Allow"
    actions = [
        "s3:PutObject",
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:DeleteObject",
        "s3:DeleteObjectVersion"
    ]
    resources = ["${var.arn_bucket}/*"]
  }
  statement {
    effect = "Allow"
    actions = [
        "s3:ListBucket"
    ]
    resources = [var.arn_bucket]
  }
}



resource "aws_iam_role" "snowflake_role" {
  name = var.namerole
  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
}



resource "aws_iam_role_policy" "test_policy" {
  name = var.namepolicy
  role = aws_iam_role.snowflake_role.id
  policy = data.aws_iam_policy_document.policy_permissions.json
}
