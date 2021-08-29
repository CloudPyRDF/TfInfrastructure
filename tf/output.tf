output "input_bucket_arn" {
  value = aws_s3_bucket.input_bucket.arn
}

output "output_bucket_arn" {
  value = aws_s3_bucket.output_bucket.arn
}
# output "output_bucket_arn" {
#   value = aws_s3_bucket.output_bucket.arn
# }


# resource "null_resource" "ecr_repo_init" {
#   provisioner "local-exec" {
#     command = "./init_ecr.sh ${var.root_docker_image_repository_url} ${aws_ecr_repository.root_worker.repository_url}"
#   }
# }
