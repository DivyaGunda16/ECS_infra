terraform {
  required_providers {
    docker = {
        source = "registry.terraform.io/divyagunda/demo"
        version = "20.10.17"
    }
  }
}

provider "docker" {

}

terraform {
  required_providers {
     aws = {
        source = "registry.terraform.io/hashicorp/aws"
        version = "2.7.34"
    }
  }
}

provider "aws" {
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  
  //profile = "bttstaging"
  region =  var.region
  
}



  
