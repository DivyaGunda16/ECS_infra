provider "aws" {
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
  //profile = "bttstaging"
  region =  var.region
}

/*provider "docker" {
    registry_auth {
       address = local.aws_ecr_url
       username = data.aws_ecr_authorization_token.token.username
       password = data.aws_ecr_authorization_token.token.password
}
}*/