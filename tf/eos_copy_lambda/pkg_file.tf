# data "archive_file" "lambda_zip" {
#   type        = "zip"
#   source_dir  = "src"
#   output_path = "check_foo.zip"
# }

data "local_file" "pkg_file" {
  filename = var.pkg_filename
}
