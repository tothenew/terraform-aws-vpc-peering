# VPC Peering Connection Variables
app_name             = "vpc-peering"                 # App middle prefix name
project_name_prefix  = "dev-tothenew"                # Prefix for the project name
common_tags = {
  Project = "ToTheNew"                               # Common tags for resources
}

# VPC Peering Details
accepter_region       = "us-east-2"                   # Region of the accepter VPC (same region in your case)
accepter_owner_id     = 0                             # Set to 0 for same account
accepter_vpc_id       = "vpc-00da5792f9cb19678"       # Replace with the accepter VPC ID
requester_vpc_id      = "vpc-09aceeb53e4bd8994"       # Replace with the requester VPC ID

# Peering Acceptance and DNS Resolution
auto_accept_peering   = true                          # Automatically accept the peering connection (set to true for same region/account)
requester_dns_resolution = true                      # Allow DNS resolution in requester VPC
accepter_dns_resolution = true                       # Allow DNS resolution in accepter VPC

# Routing Options
create_peering_routes = true                         # Set to true if you want to create peering routes
route_table_id        = "rtb-07555a2b21ca0bdd8"      # Replace with your Route Table ID
destination_cidr_blocks = [
  "10.0.0.0/16",                                      # Replace with CIDR blocks of the destination VPC(s)
  "172.16.0.0/16"
]
