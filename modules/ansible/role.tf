# Create IAM policy with a policy document to allow Ansible Node perform specific actions on AWS account to discover
# instances created by ASG without escalating the Ansible Node priviledges
data "aws_iam_policy_document" "OAPACPUJP-policydoc" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
      "autoscaling:Describe*",
      "ec2:DescribeTags*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "OAPACPUJP-policy" {
  name   = "k8s-policy-aws-cli"
  path   = "/"
  policy = data.aws_iam_policy_document.OAPACPUJP-policydoc.json
}

# Create IAM role with a policy document to allow Ansible Node assume role
data "aws_iam_policy_document" "OAPACPUJP-policydoc-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "OAPACPUJP-role" {
  name               = "OAPACPUJP"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.OAPACPUJP-policydoc-role.json
}

# Attach the IAM policy to the IAM role created
resource "aws_iam_role_policy_attachment" "k8s-policy-role-attach" {
  role       = aws_iam_role.OAPACPUJP-role.name
  policy_arn = aws_iam_policy.OAPACPUJP-policy.arn
}

# Create IAM instance profile to be attached to our Ansible Node
resource "aws_iam_instance_profile" "OAPACPUJP-IAM-profile1" {
  name = "OAPACPUJP-IAM-profile1"
  role = aws_iam_role.OAPACPUJP-role.name
}