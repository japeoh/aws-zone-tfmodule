variable role_arn {}

variable region {}

variable name {}

variable "name_suffix" {}

variable tags {
  type    = map(string)
  default = {}
}

variable vpc_id {}

variable number_of_availability_zones {
  type    = number
  default = 2
}

variable cidr_block {}

variable ingress_cidr_block {
  default = ""
}
variable egress_cidr_block {
  default = ""
}

data aws_availability_zones available {}

data aws_vpc vpc {
  id = var.vpc_id
}

output subnet_ids {
  value = aws_subnet.zone.*.id
}

output route_table_ids {
  value = aws_route_table.zone.*.id
}

output network_acl_id {
  value = aws_network_acl.zone.id
}

provider aws {
  version = "~> 2.53"
  region  = var.region

  assume_role {
    role_arn = var.role_arn
  }
}
