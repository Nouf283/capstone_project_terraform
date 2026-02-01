#Elastic IP (For NAT)

resource "aws_eip" "nat" {
  domain = "vpc"
}

#NAT Gateway (Outbound Internet for Private Subnets)
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "main-nat"
  }
}
