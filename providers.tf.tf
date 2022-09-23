terraform {
  required_providers {
    docker = {
      source = "divyagunda/demo"
      versiversion = "20.10.17"
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