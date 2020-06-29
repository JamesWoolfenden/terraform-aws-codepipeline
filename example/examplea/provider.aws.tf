provider "aws" {
  region  = "eu-west-1"
  version = "2.68.0"
}

provider "local" {
  version = "1.3"
}

provider "template" {
  version = "2.1"
}
