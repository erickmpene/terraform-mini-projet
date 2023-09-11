resource "aws_ebs_volume" "ebs" {
  availability_zone = var.az-a
  size              = var.size_ebs

  tags = {
    Name = "${var.prefix_name}-ebs"
  }
}