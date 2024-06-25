provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "<YOUR_ROLE>"
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "root_account"

  # If you don't have the domain on another account, just remove this and leave just the above provider,
  # also CTRL + SHIFT + F root_account and remove all the references 
  assume_role {
    role_arn    = "<YOUTUBE_ROLE>"
    external_id = "7cacab4d-c52c-473c-8db2-883391bc030d"
  }
}
