
output "vpc_id" {
  value = aws_vpc.base.id
}

output "subnet_id" {
  value = aws_subnet.public[0].id
}