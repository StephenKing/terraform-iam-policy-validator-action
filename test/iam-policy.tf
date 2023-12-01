resource "aws_iam_policy" "this" {
  policy = data.aws_iam_policy_document.iam_policy.json
}

data "aws_iam_policy_document" "iam_policy" {
  statement {
    sid    = "Test"
    effect = "Allow"
    actions = ["ec2:*"]
    resources = ["*"]
  }
}
