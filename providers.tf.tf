terraform {
  required_providers {
    docker = {
      source = "divyagunda/demo"
      version = "20.10.17"
    }
    aws = {
      source = "hashicorp/aws"
      version = "1.3.0"
    }
  }
}


provider "aws" {
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  //profile = "bttstaging"
  region =  var.region
}

provider "docker" {

}