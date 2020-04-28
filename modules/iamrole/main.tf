data "aws_iam_policy_document" "trust_relationship" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "AWS"
      identifiers = ["arn:aws:iam::338456148177:user/myuser"]
    }
  }
}



data "aws_iam_policy_document" "policy_permissions" {
  statement {
    effect = "Allow"
    actions = [
        "s3:*"
    ]
    resources = ["arn:aws:s3:::*"]
  }
}



resource "aws_iam_role" "role_assumible" {
  name = "roleAssumible"
  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
}



resource "aws_iam_role_policy" "test_policy" {
  name = "policyForAssumibleRole"
  role = aws_iam_role.role_assumible.id
  policy = data.aws_iam_policy_document.policy_permissions.json
}
