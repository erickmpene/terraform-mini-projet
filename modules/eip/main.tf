resource "aws_eip" "eip-bootcamp-ec2" {
  instance = var.ec2_instance
  provisioner "local-exec" {
    command = "echo PUBLIC_IP: ${aws_eip.eip-bootcamp-ec2.public_ip} > ./app/ip_ec2.txt"
  }
  tags = {
    Name = "${var.prefix_name}-eip"
  }
}