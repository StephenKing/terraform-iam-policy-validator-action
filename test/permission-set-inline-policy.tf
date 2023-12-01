data "aws_ssoadmin_instances" "this" {}

resource "aws_ssoadmin_permission_set" "test" {
  instance_arn = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  name         = "test"
}

resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  inline_policy      = data.aws_iam_policy_document.permission_set_inline_policy.json
  permission_set_arn = aws_ssoadmin_permission_set.test.arn
  instance_arn       = tolist(data.aws_ssoadmin_instances.this.arns)[0]
}

data "aws_iam_policy_document" "permission_set_inline_policy" {
  statement {
    sid    = "Test"
    effect = "Allow"
    actions = ["ec2:*"]
    resources = ["*"]
  }
}
