resource "aws_security_group" "allow_http" {
  description = "security group allow http"
  name        = "${var.prefix_name}-allow_http"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]

  }
  tags = {
    Name        = "${var.prefix_name}-allow-http-ec2"
  }

}
resource "aws_security_group" "allow_https" {
  description = "security group allow https"
  name        = "${var.prefix_name}-allow_https"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]
    }
  tags = {
    Name        = "${var.prefix_name}-allow-https_ec2"
  }
}

resource "aws_security_group" "allow_ssh" {
  description = "security group allow ssh"
  name        = "${var.prefix_name}-allow_ssh"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_all_ip]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_all_ip]

  }
  tags = {
    Name        = "${var.prefix_name}-allow-ssh-ec2"
  }

}