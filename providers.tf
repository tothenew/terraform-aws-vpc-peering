provider "aws" {
  alias  = "this"
  region = "us-east-2" # <-- Change this to your requester's region
  profile = "default"  # or use `access_key` + `secret_key`
}

provider "aws" {
  alias  = "peer"
  region = "us-east-2" # <-- Change this to the accepter's region
  profile = "default" # or credentials for the accepter account
}
