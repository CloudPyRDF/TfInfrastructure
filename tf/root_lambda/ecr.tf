resource "aws_ecr_repository" "root_repository" {
  name                 = "root_lambda"
  image_tag_mutability = "MUTABLE"

  provisioner "local-exec" {
    command = <<EOF
./push_image.sh ${self.name}:worker ${var.root_image_uri}:worker ${var.aws_region} &&\
./push_image.sh ${self.name}:replicator ${var.root_image_uri}:replicator ${var.aws_region} &&\
./push_image.sh ${self.name}:reducer ${var.root_image_uri}:reducer ${var.aws_region}
EOF
  }

  tags = {
    "app:region" = var.aws_region
  }

  provisioner "local-exec" {
    when    = destroy
    command = "./destroy_ecr.sh ${self.name} ${self.tags["app:region"]}"
  }
}

