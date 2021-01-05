data "local_file" "pkg_file" {
  filename = "pkg/${var.lambda_name}.zip"
}
