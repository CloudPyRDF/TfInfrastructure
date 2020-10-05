

# EFS file system
resource "aws_efs_file_system" "root_efs" {
  tags = {
    Name = "root_efs"
  }
}

# Mount target connects the file system to the subnet
resource "aws_efs_mount_target" "root_efs_mount" {
  file_system_id  = aws_efs_file_system.root_efs.id
  subnet_id       = var.lambda_subnet
  security_groups = [var.lambda_sg]
}

# EFS access point used by lambda file system
resource "aws_efs_access_point" "access_point_for_lambda" {
  file_system_id = aws_efs_file_system.root_efs.id
  root_directory {
    path = "/lambda"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "777"
    }
  }

  posix_user {
    gid = 1000
    uid = 1000
  }
}