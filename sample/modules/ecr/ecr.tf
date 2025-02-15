resource "aws_ecr_repository" "ecr_repos" {
  for_each = { for repo in var.repository_names : repo => repo }

  name                 = each.value
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = var.tags
}


resource "aws_ecr_repository_policy" "all_repos" {

  for_each = { for repo in var.repository_names : repo => repo }

  repository = each.value

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowPushPull",
        "Effect": "Allow",
        "Principal": {
          "AWS": var.account_ids
        },
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
      ]
  })

  depends_on = [ aws_ecr_repository.ecr_repos ]

}