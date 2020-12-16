

# EFS file system
resource "aws_efs_file_system" "root_efs" {
  tags = {
    Name = "root_efs"
  }
}

# Mount target connects the file system to the subnet
resource "aws_efs_mount_target" "root_efs_mount" {
  file_system_id  = aws_efs_file_system.root_efs.id
  subnet_id       = aws_subnet.efs_root.id
  security_groups = [aws_security_group.default.id]
}

# EFS access point used by lambda file system
resource "aws_efs_access_point" "access_point_for_lambda" {
  file_system_id = aws_efs_file_system.root_efs.id
  root_directory {
    path = "/cern_root"
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
  depends_on = [aws_efs_mount_target.root_efs_mount]
}