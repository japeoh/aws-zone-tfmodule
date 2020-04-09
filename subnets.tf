resource aws_subnet zone {
  count = var.number_of_availability_zones

  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.cidr_block, local.subnet_newbits, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(
    local.tags,
    map(
      "Name", format("%s-%s.%s", var.name, count.index + 1, var.name_suffix),
      "AZ", element(data.aws_availability_zones.available.names, count.index),
    )
  )
}
