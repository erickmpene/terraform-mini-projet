#Ici vous pouvez surcharger les variables.

prefix_name     = "bootcamp"
public_ip_allow = "0.0.0.0/0"
vpc_cidr_block  = "172.16.0.0/16"
private_subnets = "172.16.0.0/20"
public_subnets  = "172.16.32.0/20"
az-a            = "eu-west-3a"
http_port       = 80
https_port      = 443
ssh_port        = 22
ingress_all_ip  = "0.0.0.0/0"
egress_all_ip   = "0.0.0.0/0"
size_ebs        = 20
key_name                      = "bootcamp"              # put your key here
ami                           = "ami-05b5a865c3579bbc4" # put your ami here 
instance_type                 = "t2.micro"
associate_public_ip_address   = "true"
ami_owner                     = "099720109477"
ami_owner_name                = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64*"
ami_owner_virtualization_type = "hvm"
ami_owner_root_device_type    = "ebs"

