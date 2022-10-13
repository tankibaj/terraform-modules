resource "aws_eip" "this" {
  network_border_group = var.network_border_group
  vpc                  = var.vpc
  tags = {
    Name      = var.name
    Terraform = true
  }
}