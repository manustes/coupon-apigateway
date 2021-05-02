provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

provider "aws" {
  alias  = "ses"
  region = "us-east-1"
}
