terraform {
  required_providers {
    docker = {
        source = "divyagunda/demo"
        version = "20.10.17"
    }
    
  }
}

terraform {
 required_providers {
     aws = {
        source = "hashicorp/aws"
        version = "v1.3.0"
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


