################################################################################
# Requester
################################################################################
data "aws_vpc" "requester" {
  provider = aws.requester
  id       = var.requester_vpc_id
}

data "aws_subnets" "requester" {
  provider = aws.requester
  filter {
    name   = "vpc-id"
    values = [var.requester_vpc_id]
  }
}

# Get all route tables from the requester vpc
data "aws_route_table" "requester" {
  count     = length(data.aws_subnets.requester.ids)

  provider  = aws.requester
  subnet_id = data.aws_subnets.requester.ids[count.index]
}


################################################################################
# Accepter
################################################################################
data "aws_vpc" "accepter" {
  provider = aws.accepter
  id       = var.accepter_vpc_id
}

data "aws_subnets" "accepter" {
  provider = aws.accepter
  filter {
    name   = "vpc-id"
    values = [var.accepter_vpc_id]
  }
}

# Get all route tables from the accepter vpc
data "aws_route_table" "accepter" {
  count     = length(data.aws_subnets.accepter.ids)

  provider  = aws.accepter
  subnet_id = data.aws_subnets.accepter.ids[count.index]
}