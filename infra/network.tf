module "module-network" {
  source = "../modules/network"
    
  vpc_name = "vpc-${var.client}-${var.contexte}"
  vpc_cidr = var.net_vpc_cidr
   
  vpc_subnets = [
    {
      subnet_name       = "sub-${var.client}-${var.contexte}"
      subnet_cidr       = var.net_subnet_cidr
      subnet_gateway_ip = var.net_subnet_gateway_ip
      subnet_prim_dns   = var.net_subnet_prim_dns
      subnet_sec_dns    = var.net_subnet_sec_dns
    }
  ]

  vpc_snat_subnets = [
    "sub-${var.client}-${var.contexte}"
  ]

  enable_nat_gateway      = var.net_enable_nat_gateway
  new_eip                 = var.net_new_eip
  eip_bandwidth           = var.net_eip_bandwidth
  nat_gateway_name        = "nat-${var.client}-${var.contexte}"
  nat_gateway_type        = var.net_nat_gateway_type
  nat_gateway_subnet_name = "sub-${var.client}-${var.contexte}"
}
