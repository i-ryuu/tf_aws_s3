
# Create S3 full bucket policy
data "template_file" "bucket_policy" {
  template = "${file("${path.module}/templates/bucket.policy.json")}"

  vars {
    account_id = "${var.account_id}"
    role_name  = "${var.iam_roll_name}"
    bucket     = "${var.bucket_name}"
    # See https://github.com/hashicorp/terraform/issues/9368
    action     = "${jsonencode(split(",", var.action))}"
  }
}


resource "aws_s3_bucket" "with_policy" {
  bucket = "${var.bucket_name}"
  policy = "${data.template_file.bucket_policy.rendered}"
}
