resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public_1a.id

  depends_on = [aws_internet_gateway.this]

  tags = {
    Name = "devops-na-nuvem-vpc-nat-gateway"
  }
}
