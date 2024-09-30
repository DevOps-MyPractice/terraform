variable "vpc_id" {
  description = "vpc_id"
  type        = string
}
variable "web_security_group" {
  type = object({
    Name        = string
    description = string
    ingress_rules = list(object({
      cidr_ipv4   = string
      port        = number
      ip_protocol = string
    }))
  })
}