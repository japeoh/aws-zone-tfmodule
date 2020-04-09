resource aws_route_table zone {
  count = var.number_of_availability_zones

  vpc_id = var.vpc_id

  tags = merge(
    local.tags,
    map(
      "Name", format("%s-%s.%s", var.name, count.index + 1, var.name_suffix),
      "AZ", element(data.aws_availability_zones.available.names, count.index),
    )
  )
}

resource aws_route_table_association zone {
  count = var.number_of_availability_zones

  route_table_id = aws_route_table.zone.*.id[count.index]
  subnet_id      = aws_subnet.zone.*.id[count.index]
}
