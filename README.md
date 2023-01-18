# terraform-aws-vpc-peering

[![Lint Status](https://github.com/tothenew/terraform-aws-vpc-peering/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-vpc-peering/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-vpc-peering)](https://github.com/tothenew/terraform-aws-vpc-peering/blob/master/LICENSE)

##Introduction
   This module will create VPC peering.

# Usages
```
# VPC Peering within AWS account
module "peering_within_account" {
  source           = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_vpc_id  = "vpc-111111111111"
  requester_vpc_id = "vpc-999999999999"
}

OR

# VPC Peering within different AWS account
provider "aws" {
  region = "ap-south-1"
  profile = "current-profile-name"
  # Requester's credentials.
}

provider "aws" {
  alias  = "peer"
  region = "us-east-1"
  profile = "peer-profile-name"
  # Accepter's credentials.
}

module "peering_different_account" {
  source              = "git::https://github.com/tothenew/terraform-aws-vpc-peering.git"
  accepter_region     = "us-east-1"
  accepter_owner_id   = "111111111111"
  accepter_vpc_id     = "vpc-111111111111"
  requester_vpc_id    = "vpc-999999999999"
  auto_accept_peering = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.peer"></a> [aws.peer](#provider\_aws.peer) | n/a |
| <a name="provider_aws.this"></a> [aws.this](#provider\_aws.this) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_peering_connection.vpc_peering_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.peer_accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.accepter_dns_resolution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_vpc_peering_connection_options.requester_dns_resolution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepter_dns_resolution"></a> [accepter\_dns\_resolution](#input\_accepter\_dns\_resolution) | Indicates whether a local VPC can resolve public DNS hostnames to private IP addresses when queried from instances in a accepter VPC. | `bool` | `false` | no |
| <a name="input_accepter_owner_id"></a> [accepter\_owner\_id](#input\_accepter\_owner\_id) | The AWS account ID of the owner of the peer VPC. | `number` | `0` | no |
| <a name="input_accepter_region"></a> [accepter\_region](#input\_accepter\_region) | The region of the accepter VPC of the VPC Peering Connection. | `string` | `""` | no |
| <a name="input_accepter_vpc_id"></a> [accepter\_vpc\_id](#input\_accepter\_vpc\_id) | The ID of the VPC with which you are creating the VPC Peering Connection. | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | App middle prefix name | `string` | `"waf-log-service"` | no |
| <a name="input_auto_accept_peering"></a> [auto\_accept\_peering](#input\_auto\_accept\_peering) | Whether or not to accept the peering request. | `bool` | `false` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map to add common tags to all the resources | `map(string)` | <pre>{<br>  "Project": "ToTheNew"<br>}</pre> | no |
| <a name="input_project_name_prefix"></a> [project\_name\_prefix](#input\_project\_name\_prefix) | A string value to describe prefix of all the resources | `string` | `"dev-tothenew"` | no |
| <a name="input_requester_dns_resolution"></a> [requester\_dns\_resolution](#input\_requester\_dns\_resolution) | Indicates whether a local VPC can resolve public DNS hostnames to private IP addresses when queried from instances in a requester VPC. | `bool` | `false` | no |
| <a name="input_requester_vpc_id"></a> [requester\_vpc\_id](#input\_requester\_vpc\_id) | The ID of the requester VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_peering_id"></a> [vpc\_peering\_id](#output\_vpc\_peering\_id) | n/a |
| <a name="output_vpc_peering_status"></a> [vpc\_peering\_status](#output\_vpc\_peering\_status) | n/a |
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-vpc-peering/blob/main/LICENSE) for full details.
