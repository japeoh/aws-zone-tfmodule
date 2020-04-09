resource aws_network_acl zone {
  vpc_id     = var.vpc_id
  subnet_ids = aws_subnet.zone.*.id

  tags = merge(
    local.tags,
    map(
      "Name", local.zone_name,
    )
  )

  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = -1
    cidr_block = local.ingress_cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    rule_no    = 100
    action     = "allow"
    protocol   = -1
    cidr_block = local.egress_cidr_block
    from_port  = 0
    to_port    = 0
  }
}
