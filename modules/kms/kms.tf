resource "aws_kms_key" "mykey" {
  deletion_window_in_days = 7
  policy                  =  <<EOF
  {
      "Version": "2012-10-17",
      "Id": "key-consolepolicy-3",
      "Statement": [
          {
              "Sid": "Enable IAM User Permissions",
              "Effect": "Allow",
              "Principal": {
                  "AWS": "arn:aws:iam::338456148177:root"
              },
              "Action": "kms:*",
              "Resource": "*"
          }
      ]
  }
EOF
}

resource "aws_kms_alias" "mykeyalias" {
  name          = "alias/${var.kms_alias}"
  target_key_id = "${aws_kms_key.mykey.key_id}"
}
