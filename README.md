# AWS Zone Terrafom Module

This module create a Zone within a VPC with the following resources

*   _x_ Subnets created across the requested number of AWS Availability Zones
*   For each Subnet, a Route Table
*   For the Zone, a Network ACL allowing ingress and egress to / from the provided CIDR blocks
*   All resources will be tagged with Zone: name.name_suffix
*   Subnets and Route Tables will be tagged with Name: name-x.name_suffix, when x = 1 to number_of_availability_zones
*   Subnets and Route Tables will be tagged with AZ: the Availability Zone the Subnet is created in

## Variables

| Name                         | Description
|------------------------------|---
| role_arn                     | The role to assume to create resources
| region                       | The AWS region to create resources in
| name                         | The name of the Zone
| name_suffix                  | The suffix to apply to names of resources created by the module
| tags                         | A map of tags to apply to the created resources
| vpc_id                       | The ID for the VPC to create the Zone in
| number_of_availability_zones | The number of availability zones to create resources across
| cidr_block                   | The CIDR block for the complete Zone
| ingress_cidr_block           | The CIDR block that will allowed to ingress into the Zone
| egress_cidr_block            | The CIDR block that the Zone will allowed to egress to

## Output

| Name           | Description
|----------------|---
|subnet_ids      | A list of ids for the created subnets 
|route_table_ids | A list of ids for the created route tables (one per subnet)
|network_acl_id  | The id of the NACL created for the zone
