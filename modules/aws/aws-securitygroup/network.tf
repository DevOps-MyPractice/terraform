resource "aws_security_group" "web" {
  name        = "web"
  description = "allow 22"
  vpc_id      = var.vpc_id
}
resource "aws_vpc_security_group_ingress_rule" "web" {
  count             = length(var.web_security_group.ingress_rules)
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = var.web_security_group.ingress_rules[count.index].cidr_ipv4
  from_port         = var.web_security_group.ingress_rules[count.index].port
  ip_protocol       = var.web_security_group.ingress_rules[count.index].ip_protocol
  to_port           = var.web_security_group.ingress_rules[count.index].port
  depends_on        = [aws_security_group.web]
}
resource "aws_vpc_security_group_egress_rule" "web" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  depends_on        = [aws_security_group.web]
}
