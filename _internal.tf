locals {
  zone_name          = format("%s.%s", var.name, var.name_suffix)
  ingress_cidr_block = length(var.ingress_cidr_block) > 0 ? var.ingress_cidr_block : data.aws_vpc.vpc.cidr_block
  egress_cidr_block  = length(var.egress_cidr_block) > 0 ? var.egress_cidr_block : data.aws_vpc.vpc.cidr_block
  subnet_newbits     = ceil(log(var.number_of_availability_zones, 2))

  tags = merge(
    var.tags,
    map("Zone", local.zone_name, ),
  )
}
