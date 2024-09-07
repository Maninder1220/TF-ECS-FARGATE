resource "aws_iam_role" "ecs_user" {
  name = var.username
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

}


data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}