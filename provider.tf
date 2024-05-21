provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::654654554686:role/devops-na-nuvem-week-terraform-role"
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "root_account"

  assume_role {
    role_arn    = "arn:aws:iam::968225077300:role/terraform-role-external"
    external_id = "7cacab4d-c52c-473c-8db2-883391bc030d"
  }
}
