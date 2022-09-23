terraform {
  required_providers {
    docker = {
      source = "divyagunda/demo"
      versiversion = "20.10.17"
    }
    aws = {
      sousource = "hashicorp/aws"
      version = "~> 3.0"
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