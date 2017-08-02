terraform {
  backend "s3" {
    bucket = "terraform-state-sandbox.jetbrains.com"
    key = "teamcity/ecs/terraform.tfstate"
    profile = "default"
    region = "eu-west-1"
  }
  required_version = ">=0.9.8"
}

provider "aws" {
  region = "us-east-1"
}