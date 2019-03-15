provider "aws" {
  region  = "eu-west-1"
  version = "2.00"
}

provider "local" {
  version = "1.1"
}

provider "template" {
  version = "2.1"
}
