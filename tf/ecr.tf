resource "aws_ecr_repository" "root_worker" {
  name                 = "root_worker"
  image_tag_mutability = "MUTABLE"
}
