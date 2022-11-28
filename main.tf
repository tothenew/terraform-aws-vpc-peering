module  "vpc2" {
    source      = "./modules/vpc2"
    providers = {
    aws = aws.vpc2
  }

}

module  "vpc1"  {
    source      = "./modules/vpc1"
    providers = {
    aws = aws.default

  }

  
}



module  "requestor" {
    source      = "./modules/Vpc_peering/requestor"
    
  vpc1_id = module.vpc1.vpc1id
  vpc2_id = module.vpc2.vpc2id



}

module  "accepter" {
    source  = "./modules/Vpc_peering/acceptor"
    providers = {
    aws = aws.vpc2

  }
  pcx_id = module.requestor.pcxid
}
