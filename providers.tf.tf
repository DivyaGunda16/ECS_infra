terraform {
  required_providers {
    docker = {
        source = "divyagunda/demo"
        version = "20.10.17"
    }
    
  }
}

provider "docker" {

}

/*provider "aws" {
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  //profile = "bttstaging"
  region =  var.region

   aws = {
        source = "hashicorp/aws"
        version = "v1.3.0"
    }
}*/




