terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        //version = "20.10.17"
    }
      aws = {
        source = "hashicorp/aws"
        //version = "~> 7.34"
    }
  }
}

provider "docker" {

}

provider "aws" {
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
   region =  var.region  
}



  
