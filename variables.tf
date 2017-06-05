variable "account_id" {
    type = "string"
    description = "aws_caller_identity account id"
}

variable "bucket_name" {
  type        = "string"
  description = "using wordpress"
}

variable "iam_roll_name" {
    type = "string"
    description = "S3 allow policy of IAM roll name"
}

variable "action" {
    description = <<EOF
    You need policy permissions.
    ex. default = "s3:*,s3:....,s3:...."
EOF
    # https://github.com/hashicorp/terraform/issues/9368
    default = "s3:*"
}
