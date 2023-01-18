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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-vpc-peering/blob/main/LICENSE) for full details.
