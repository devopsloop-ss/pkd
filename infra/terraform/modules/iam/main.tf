#Pricipal policy document data source
data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

#Role for master instance
resource "aws_iam_role" "master_role" {
  name               = "pkt-master_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}

#Policy for master instance
resource "aws_iam_policy" "master_policy" {
  name        = "pkt-master_policy"
  description = "Policy for pkt master"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#Policy attachment for master

resource "aws_iam_role_policy_attachment" "master_policy_attach" {
  role       = aws_iam_role.master_role.name
  policy_arn = aws_iam_policy.master_policy.arn
}

#Instance profile for master instance

resource "aws_iam_instance_profile" "master_profile" {
  name = "pkt-master_profile"
  role = aws_iam_role.master_role.name
}

#Role for node

resource "aws_iam_role" "node_role" {
  name               = "pkt-node_role"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}

#Policy for node instance
resource "aws_iam_policy" "node_policy" {
  name        = "pkt-node_policy"
  description = "Policy for pkt master"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#Policy attachment for node

resource "aws_iam_role_policy_attachment" "node_policy_attach" {
  role       = aws_iam_role.node_role.name
  policy_arn = aws_iam_policy.node_policy.arn
}

#Instance profile for node instance

resource "aws_iam_instance_profile" "node_profile" {
  name = "pkt-node_profile"
  role = aws_iam_role.node_role.name
}